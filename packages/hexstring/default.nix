{ mkDerivation, aeson, base, bytestring, hpack, lib, memory, scale
, template-haskell, text
}:
mkDerivation {
  pname = "memory-hexstring";
  version = "1.0.0.0";
  src = ./.;
  libraryHaskellDepends = [
    aeson base bytestring memory scale template-haskell text
  ];
  libraryToolDepends = [ hpack ];
  prePatch = "hpack";
  homepage = "https://github.com/airalab/hs-web3#readme";
  description = "Hex-string type for Haskell Web3 library";
  license = lib.licenses.asl20;
}
