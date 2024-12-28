{
  description = "System-wide packages for Linux";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    system = "aarch64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    packages.default = pkgs.buildEnv {
      name = "linux-system-wide-packages";
      paths = [
	# Core CLI
        pkgs.bat
        pkgs.fzf
        pkgs.fd
        pkgs.htop
        pkgs.ripgrep
        pkgs.stow
        pkgs.zoxide
	# SWE Tooling
        pkgs.gh
        pkgs.jq
        pkgs.neovim
        pkgs.tmux
        pkgs.yq
	# TUIs
        pkgs.lazygit
        pkgs.lazysql
        pkgs.jqp
        pkgs.yazi
	# Random CLI
        pkgs.speedtest-cli
      ];
    };
  };
}
