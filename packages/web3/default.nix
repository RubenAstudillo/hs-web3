{ mkDerivation, base, hpack, lib, web3-ethereum, web3-polkadot
, web3-provider
}:
mkDerivation {
  pname = "web3";
  version = "1.0.0.0";
  src = ./.;
  libraryHaskellDepends = [
    base web3-ethereum web3-polkadot web3-provider
  ];
  libraryToolDepends = [ hpack ];
  prePatch = "hpack";
  homepage = "https://github.com/airalab/hs-web3#readme";
  description = "Haskell Web3 library";
  license = lib.licenses.asl20;
}
