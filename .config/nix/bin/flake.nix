{
  description = "System-wide packages for multiple architectures";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    supportedSystems = [ "x86_64-linux" "aarch64-linux" ];
    forAllSystems = f: builtins.listToAttrs (map (system: { inherit system; value = f system; }) supportedSystems);
  in
  {
    packages = forAllSystems (system: let
      pkgs = import nixpkgs { inherit system; };
    in
    pkgs.mkShell {
      buildInputs = [
        pkgs.htop
        pkgs.zoxide
        pkgs.ripgrep
        pkgs.fzf
        pkgs.fd
        pkgs.stow
        pkgs.bat
      ];
    });
  };
}
