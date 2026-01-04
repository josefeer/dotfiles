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
    globalPackages = [
      # Core CLI
      "git"
      "curl"
      "bat"
      "eza"
      "fzf"
      "fd"
      "htop"
      "ripgrep"
      "stow"
      "zoxide"
      # SWE Tooling
      "gh"
      "jq"
      "neovim"
      "tmux"
      "yq"
      "uv"
      # TUIs
      "lazygit"
      # Random CLI
      "speedtest-cli"
    ];
  in {
    packages.${systems.aarch64} = pkgsAarch64.buildEnv {
      name = "system-wide-packages-${systems.aarch64}";
      paths = builtins.map (pkg: pkgsAarch64.${pkg}) globalPackages;
    };

    packages.${systems.x86_64} = pkgsX86_64.buildEnv {
      name = "system-wide-packages-${systems.x86_64}";
      paths = builtins.map (pkg: pkgsX86_64.${pkg}) globalPackages;
    };
  };
}
