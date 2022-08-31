{ mkDerivation, base, cereal, hpack, hspec, hspec-contrib
, hspec-discover, hspec-expectations, lib, memory, memory-hexstring
, scale, wide-word
}:
mkDerivation {
  pname = "web3-bignum";
  version = "1.0.0.0";
  src = ./.;
  libraryHaskellDepends = [
    base cereal memory memory-hexstring scale wide-word
  ];
  libraryToolDepends = [ hpack ];
  testHaskellDepends = [
    base cereal hspec hspec-contrib hspec-discover hspec-expectations
    memory memory-hexstring scale wide-word
  ];
  testToolDepends = [ hspec-discover ];
  prePatch = "hpack";
  homepage = "https://github.com/airalab/hs-web3#readme";
  description = "Fixed size big integers for Haskell Web3 library";
  license = lib.licenses.asl20;
}
