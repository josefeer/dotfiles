# Unavailable desktop apps:
# - Elgato Stream Deck (third-party alternative: streamdeck-ui)
# - Mouseless (mouseless.click; pkgs.mouseless is a different project)
# - ZSA Navigator
# - Proton Drive (CLI available as proton-drive-cli)
# - Microsoft Windows App (RDP Client)

{
  description = "JFMD Linux GUI applications";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    openlogi.url = "github:AprilNEA/OpenLogi?dir=packaging";
  };

  outputs = { nixpkgs, zen-browser, openlogi, ... }:
    let
      systems = [ "aarch64-linux" "x86_64-linux" ];
    in {
      packages = nixpkgs.lib.genAttrs systems (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true; # Several desktop apps have proprietary licenses.
          };
        in {
          default = pkgs.buildEnv {
            name = "jfmdnixapps";
            paths = [
              pkgs._1password-gui
              pkgs._1password-cli
              pkgs.bruno
              pkgs.dbeaver-bin
              pkgs.google-chrome
              pkgs.obsidian
              pkgs.proton-vpn
              pkgs.todoist-electron
              openlogi.packages.${system}.default
              zen-browser.packages.${system}.default
              # pkgs.ghostty # GPU drivers are flaky when installed via Nix
              # pkgs.firefox # Already bundled with ubuntu and fedora
              # pkgs.teams-for-linux # Unofficial client
              # pkgs.tailscale # Requires a system-managed tailscaled service, not just this app bundle.
            ] ++ nixpkgs.lib.optionals (system == "x86_64-linux") [
              # x86_64-only binaries.
              pkgs.keymapp
              pkgs.onlyoffice-desktopeditors
              pkgs.spotify
              pkgs.zoom-us
            ];
          };
        });
    };
}
