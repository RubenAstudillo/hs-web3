{ mkDerivation, aeson, base, bytestring, exceptions, hpack
, http-client, http-client-tls, lib, mtl, random, text, websockets
}:
mkDerivation {
  pname = "jsonrpc-tinyclient";
  version = "1.0.0.0";
  src = ./.;
  libraryHaskellDepends = [
    aeson base bytestring exceptions http-client http-client-tls mtl
    random text websockets
  ];
  libraryToolDepends = [ hpack ];
  prePatch = "hpack";
  homepage = "https://github.com/airalab/hs-web3#readme";
  description = "Tiny JSON-RPC client for Haskell Web3 library";
  license = lib.licenses.asl20;
}
