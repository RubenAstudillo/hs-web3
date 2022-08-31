{ mkDerivation, aeson, base, basement, bytestring, cereal
, data-default, generics-sop, hpack, hspec, hspec-contrib
, hspec-discover, hspec-expectations, lib, memory, memory-hexstring
, microlens, OneTuple, parsec, tagged, template-haskell, text
, web3-crypto
}:
mkDerivation {
  pname = "web3-solidity";
  version = "1.0.0.0";
  src = ./.;
  libraryHaskellDepends = [
    aeson base basement bytestring cereal data-default generics-sop
    memory memory-hexstring microlens OneTuple parsec tagged
    template-haskell text web3-crypto
  ];
  libraryToolDepends = [ hpack ];
  testHaskellDepends = [
    aeson base basement bytestring cereal data-default generics-sop
    hspec hspec-contrib hspec-discover hspec-expectations memory
    memory-hexstring microlens OneTuple parsec tagged template-haskell
    text web3-crypto
  ];
  testToolDepends = [ hspec-discover ];
  prePatch = "hpack";
  homepage = "https://github.com/airalab/hs-web3#readme";
  description = "Solidity language for Haskell Web3 library";
  license = lib.licenses.asl20;
}
