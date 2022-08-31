{ mkDerivation, async, base, data-default, exceptions, hpack
, http-client, jsonrpc-tinyclient, lib, mtl, network, text
, transformers, websockets
}:
mkDerivation {
  pname = "web3-provider";
  version = "1.0.0.0";
  src = ./.;
  libraryHaskellDepends = [
    async base data-default exceptions http-client jsonrpc-tinyclient
    mtl network text transformers websockets
  ];
  libraryToolDepends = [ hpack ];
  prePatch = "hpack";
  homepage = "https://github.com/airalab/hs-web3#readme";
  description = "Node connection provider for Haskell Web3 library";
  license = lib.licenses.asl20;
}
