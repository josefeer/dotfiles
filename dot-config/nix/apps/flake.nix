{
  description = "JFMD Linux GUI applications";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
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
            config.allowUnfree = true; # Obsidian has a proprietary license.
          };
        in {
          default = pkgs.buildEnv {
            name = "jfmdnixapps";
            paths = [
              zen-browser.packages.${system}.default
              pkgs.ghostty
              pkgs.obsidian
              openlogi.packages.${system}.default
            ] ++ nixpkgs.lib.optionals (system == "x86_64-linux") [
              # ONLYOFFICE's nixpkgs binary is not available on aarch64-linux.
              pkgs.onlyoffice-desktopeditors
            ];
          };
        });
    };
}
