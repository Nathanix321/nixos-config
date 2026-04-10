{
  gabbro,
  inputs,
  den,
  ...
}:
{
  gabbro.gaming.provides = {
    min =
      { host, ... }:
      {
        nixos =
          { pkgs, ... }:
          {
            boot.kernelModules = [ "ntsync" ];
            environment.systemPackages = with pkgs; [
              # Launchers
              cartridges
              heroic
              lutris
              # (lutris.override {
              #   extraPkgs = _: [ umu-launcher ];
              # })
              prismlauncher
              umu-launcher
            ];
            hardware.graphics.enable32Bit = true;
            programs = {
              steam = {
                enable = true;
                extraCompatPackages = with pkgs; [
                  proton-ge-bin
                  steamtinkerlaunch
                ];
              };
              gamescope = {
                enable = true;
                args = [
                  "-W ${toString host.primaryDisplay.width}"
                  "-H ${toString host.primaryDisplay.height}"
                  "-r ${toString host.primaryDisplay.refresh}"
                  "-O ${host.primaryDisplay.name}"
                  "-f"
                  "--adaptive-sync"
                  "--mangoapp"
                ];
              };
            };
          };
      };

    max = den.lib.parametric {
      includes = [
        gabbro.gaming._.replays
        gabbro.gaming._.min
      ];
      nixos =
        { pkgs, ... }:
        {
          imports = [
            inputs.nix-gaming.nixosModules.platformOptimizations
            inputs.nix-gaming.nixosModules.pipewireLowLatency
          ];
          hardware.opentabletdriver.enable = true;
          services = {
            input-remapper.enable = true;
            pipewire.lowLatency = {
              enable = true;
              quantum = 32;
            };
          };
          programs = {
            steam = {
              platformOptimizations.enable = true;
              remotePlay.openFirewall = true;
              localNetworkGameTransfers.openFirewall = true;
            };
          };
          environment.systemPackages = with pkgs; [
            # Utility
            deadlock-mod-manager
            goverlay
            lsfg-vk
            lsfg-vk-ui
            ludusavi
            mangohud
            protonplus
            protontricks
            r2modman
            winetricks
          ];
        };
    };
  };
}
