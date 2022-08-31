{ mkDerivation, aeson, animalcase, base, base58-bytestring
, bytestring, containers, cryptonite, generics-sop, hpack, hspec
, hspec-contrib, hspec-discover, hspec-expectations
, hspec-expectations-json, jsonrpc-tinyclient, lib, memory
, memory-hexstring, microlens, microlens-mtl, microlens-th, mtl
, parsec, scale, text, web3-bignum, web3-crypto
}:
mkDerivation {
  pname = "web3-polkadot";
  version = "1.0.0.0";
  src = ./.;
  libraryHaskellDepends = [
    aeson animalcase base base58-bytestring bytestring containers
    cryptonite generics-sop jsonrpc-tinyclient memory memory-hexstring
    microlens microlens-mtl microlens-th mtl parsec scale text
    web3-bignum web3-crypto
  ];
  libraryToolDepends = [ hpack ];
  testHaskellDepends = [
    aeson animalcase base base58-bytestring bytestring containers
    cryptonite generics-sop hspec hspec-contrib hspec-discover
    hspec-expectations hspec-expectations-json jsonrpc-tinyclient
    memory memory-hexstring microlens microlens-mtl microlens-th mtl
    parsec scale text web3-bignum web3-crypto
  ];
  testToolDepends = [ hspec-discover ];
  prePatch = "hpack";
  homepage = "https://github.com/airalab/hs-web3#readme";
  description = "Polkadot support for Haskell Web3 library";
  license = lib.licenses.asl20;
}
