{
  # inspired by: https://serokell.io/blog/practical-nix-flakes#packaging-existing-applications
  description = "A Hello World in Haskell with a dependency and a devShell";
  inputs.nixpkgs.url = "nixpkgs";
  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "x86_64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f system);
      nixpkgsFor = forAllSystems (system: import nixpkgs {
        inherit system;
        overlays = [ self.overlay ];
      });
    in
    {
      overlay = (final: prev: rec {

        animalcase = final.haskell.lib.doJailbreak prev.haskell.packages.ghc923.animalcase;

        vinyl =
          final.haskell.lib.dontHaddock
            (final.haskell.lib.appendBuildFlag
              (final.haskell.lib.appendConfigureFlag
                prev.haskell.packages.ghc923.vinyl
                "--ghc-option=-Wno-star-is-type")
              "--ghc-option=-XFlexibleContexts");

        relapse =
          final.haskell.lib.markUnbroken
            (final.haskell.lib.doJailbreak
              (final.haskell.lib.dontCheck
                prev.haskell.packages.ghc923.relapse));

        scale = final.haskell.lib.doJailbreak
          (final.haskell.packages.ghc923.callPackage
            (import ./packages/scale/default.nix) {});

        jsonrpc-tinyclient =
          final.haskell.lib.doJailbreak
            (final.haskell.packages.ghc923.callPackage
              (import ./packages/jsonrpc/default.nix)
              {});

        memory-hexstring =
          final.haskell.lib.doJailbreak
            (final.haskell.packages.ghc923.callPackage
              (import ./packages/hexstring/default.nix)
              { inherit scale; });

        web3-bignum =
          final.haskell.lib.doJailbreak
            (final.haskell.packages.ghc923.callPackage
              (import ./packages/bignum/default.nix)
              { inherit memory-hexstring scale; });

        web3-crypto =
          final.haskell.lib.doJailbreak
            (final.haskell.packages.ghc923.callPackage
              (import ./packages/crypto/default.nix)
              { inherit memory-hexstring; });

        # web3-ipfs =
        #   final.haskell.lib.doJailbreak
        #     (final.haskell.packages.ghc923.callPackage
        #       (import ./packages/ipfs/default.nix) {});

        web3-polkadot =
          final.haskell.lib.doJailbreak
            (final.haskell.packages.ghc923.callPackage
              (import ./packages/polkadot/default.nix)
              { inherit jsonrpc-tinyclient memory-hexstring scale web3-bignum web3-crypto animalcase; });

        web3-solidity =
          final.haskell.lib.doJailbreak
            (final.haskell.lib.dontCheck
              (final.haskell.packages.ghc923.callPackage
                (import ./packages/solidity/default.nix)
                { inherit memory-hexstring web3-crypto; }));

        web3-provider =
          final.haskell.lib.doJailbreak
            (final.haskell.packages.ghc923.callPackage
              (import ./packages/provider/default.nix)
              { inherit jsonrpc-tinyclient; });

        web3-ethereum =
          final.haskell.lib.dontCheck
            (final.haskell.lib.doJailbreak
              (final.haskell.packages.ghc923.callPackage
                (import ./packages/ethereum/default.nix)
                { inherit jsonrpc-tinyclient memory-hexstring web3-crypto web3-solidity relapse vinyl; }));

        web3 =
            (final.haskell.lib.doJailbreak
              (final.haskell.packages.ghc923.callPackage
                (import ./packages/web3/default.nix)
                { inherit web3-ethereum web3-polkadot web3-provider; }));

      });
      packages = forAllSystems (system: {
        inherit (nixpkgsFor.${system})
          scale
          relapse
          jsonrpc-tinyclient
          memory-hexstring
          web3-bignum
          web3-crypto
          # web3-ipfs
          web3-polkadot
          web3-provider
          web3-ethereum
          web3-solidity
          web3 ;
      });
      defaultPackage = forAllSystems (system: self.packages.${system}.web3);
      checks = self.packages;
      devShell = forAllSystems (system: let haskellPackages = nixpkgsFor.${system}.haskell.packages.ghc923;
        in haskellPackages.shellFor {
          packages = p: with self.packages.${system};
            [ scale
              jsonrpc-tinyclient
              memory-hexstring
              web3-bignum
              web3-crypto
              # web3-ipfs
              web3-polkadot
              web3-provider
              web3-ethereum
              web3-solidity
              web3
            ];
          withHoogle = false;
          buildInputs = with haskellPackages; [
            haskell-language-server
            ghcid
            cabal-install
          ];
        # Change the prompt to show that you are in a devShell
        # shellHook = "export PS1='\\e[1;34mdev > \\e[0m'";
        });
  };
}
