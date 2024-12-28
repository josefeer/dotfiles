{
  description = "System-wide packages for Ubuntu";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    system = "aarch64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    packages.default = pkgs.buildEnv {
      name = "ubuntu-global-packages";
      paths = [
        pkgs.bat
        pkgs.fzf
        pkgs.fd
        pkgs.htop
        pkgs.ripgrep
        pkgs.stow
        pkgs.zoxide
      ];
    };
  };
}
