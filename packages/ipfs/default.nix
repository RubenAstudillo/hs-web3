{ mkDerivation, aeson, base, bytestring, hpack, http-client
, http-media, http-types, lib, mtl, servant, servant-client, tar
, text, unordered-containers
}:
mkDerivation {
  pname = "web3-ipfs";
  version = "1.0.0.0";
  src = ./.;
  libraryHaskellDepends = [
    aeson base bytestring http-client http-media http-types mtl servant
    servant-client tar text unordered-containers
  ];
  libraryToolDepends = [ hpack ];
  prePatch = "hpack";
  homepage = "https://github.com/airalab/hs-web3#readme";
  description = "IPFS support for Haskell Web3 library";
  license = lib.licenses.asl20;
}
