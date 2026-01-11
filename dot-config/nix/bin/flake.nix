{
  description = "System-wide packages for Linux";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    systems = {
      aarch64 = "aarch64-linux";
      x86_64 = "x86_64-linux";
    };
    pkgsAarch64 = import nixpkgs { system = systems.aarch64; };
    pkgsX86_64 = import nixpkgs { system = systems.x86_64; };

    # Function to get packages for a specific pkgs instance
    getPackages = pkgs: with pkgs; [
      # Core CLI
      git
      curl
      bat
      eza
      fzf
      fd
      htop
      ripgrep
      stow
      zoxide
      # SWE Tooling
      gh
      jq
      neovim
      tmux
      yq
      uv
      opencode
      # LSP & Formatters
      pyright
      nodePackages.typescript-language-server
      # TUIs
      lazygit
      # Random CLI
      speedtest-cli
    ];
  in {
    packages.${systems.aarch64} = pkgsAarch64.buildEnv {
      name = "system-wide-packages-${systems.aarch64}";
      paths = getPackages pkgsAarch64;
    };

    packages.${systems.x86_64} = pkgsX86_64.buildEnv {
      name = "system-wide-packages-${systems.x86_64}";
      paths = getPackages pkgsX86_64;
    };
  };
}
