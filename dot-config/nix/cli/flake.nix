{
  description = "JFMD cli tools in Linux";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, ... }:
  let
    systems = [ "aarch64-linux" "x86_64-linux" ];

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
      zsh-autosuggestions
      zsh-syntax-highlighting
      # SWE Tooling
      gh
      jq
      neovim
      nodejs
      go
      rustc
      cargo
      tmux
      yq
      uv
      pi-coding-agent
      # Neovim
      tree-sitter
      # Neovim Snacks Plugin
      imagemagick
      mermaid-cli
      # TUIs
      lazygit
      # Random CLI
      speedtest-cli
      wireguard-tools
    ];
  in {
    packages = nixpkgs.lib.genAttrs systems (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        default = pkgs.buildEnv {
          name = "jfmdnixcli";
          paths = getPackages pkgs;
        };
      });
  };
}
