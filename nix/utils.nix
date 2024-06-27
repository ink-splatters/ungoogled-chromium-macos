{

  clang,
  lib,
  system,
  ...  
}: 
rec {
  getClangNixSupportFlagsFor = lstWhat:
    builtins.concatStringsSep " " (
      map (flags: (lib.removeSuffix "\n" (builtins.readFile "${clang}/nix-support/${flags}"))) lstWhat
    );
  
  getClangNixSupportCFLAGS = getClangNixSupportFlagsFor [ "cc-cflags" "libc-cflags" ];
  getClangNixSupportCXXFLAGS = getClangNixSupportFlagsFor [ "libcxx-cxxflags" ];
}



