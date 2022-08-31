{ mkDerivation, aeson, base, bytestring, containers, cryptonite
, hpack, hspec, hspec-contrib, hspec-discover, hspec-expectations
, lib, memory, memory-hexstring, text, uuid-types, vector
}:
mkDerivation {
  pname = "web3-crypto";
  version = "1.0.0.0";
  src = ./.;
  libraryHaskellDepends = [
    aeson base bytestring containers cryptonite memory memory-hexstring
    text uuid-types vector
  ];
  libraryToolDepends = [ hpack ];
  testHaskellDepends = [
    aeson base bytestring containers cryptonite hspec hspec-contrib
    hspec-discover hspec-expectations memory memory-hexstring text
    uuid-types vector
  ];
  testToolDepends = [ hspec-discover ];
  prePatch = "hpack";
  homepage = "https://github.com/airalab/hs-web3#readme";
  description = "Cryptograhical primitives for Haskell Web3 library";
  license = lib.licenses.asl20;
}
