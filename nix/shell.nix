{ callPackage, 
  coreutils,
  greadlink,
  llvmPackages_18
  lld_18,
  mkShell,
  ninja,
  pkgs, 
  pre-commit-check, 
  readline,
  system,
  xz,

  ... }:
  let
    inherit (llvmPackages_18) stdenv bintools;
    inherit (callPackage ./utils.nix { inherit system; })
      getClangNixSupportCFLAGS
      getClangNixSupportCXXFLAG;
{
  default = mkShell.override { inherit stdenv; } {

      buildInputs = [
        readline
        xz
      ];

      
      nativeBuildInputs = [
        coreutils
        greadlink
        lld_18
        bintools
      ];

      CFLAGS = getClangNixSupportCFLAGS {};
      CXXFLAGS = getClangNixSupportCXXFLAGS {};
      LDFLAGS = "-fuse-ld=lld";
  };
}