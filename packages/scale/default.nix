{ mkDerivation, base, bitvec, bytestring, cereal, data-default
, generics-sop, hpack, hspec, hspec-contrib, hspec-discover
, hspec-expectations, lib, memory, template-haskell, text, vector
}:
mkDerivation {
  pname = "scale";
  version = "1.0.0.0";
  src = ./.;
  libraryHaskellDepends = [
    base bitvec bytestring cereal data-default generics-sop memory
    template-haskell text vector
  ];
  libraryToolDepends = [ hpack ];
  testHaskellDepends = [
    base bitvec bytestring cereal data-default generics-sop hspec
    hspec-contrib hspec-discover hspec-expectations memory
    template-haskell text vector
  ];
  testToolDepends = [ hspec-discover ];
  prePatch = "hpack";
  homepage = "https://github.com/airalab/hs-web3#readme";
  description = "SCALE v2.0 codec for Haskell Web3 library.";
  license = lib.licenses.asl20;
}
