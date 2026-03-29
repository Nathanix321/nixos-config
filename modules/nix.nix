{ inputs, ... }:
{
  den.default = {
    nixos = {
      imports = [ inputs.nix-index-database.nixosModules.nix-index ];
      nixpkgs.config.allowUnfree = true;
      nixpkgs.overlays = [
        (final: prev: {
          stremio-linux-shell = (import inputs.nixpkgs-stremio-fix {
            inherit (prev) system;
            config.allowUnfree = true;
          }).stremio-linux-shell;
        })
      ];
      programs.nix-index-database.comma.enable = true;
      nix = {
        registry.nixpkgs.flake = inputs.nixpkgs;
        gc.automatic = true;
        settings = {
          keep-outputs = true;
          keep-derivations = true;
          use-xdg-base-directories = true;
        };
      };
    };
  };
}