{
  gabbro,
  config,
  inputs,
  ...
}:
{
  hostConfig.grey-slate = {
    primaryDisplay = config.hostConfig.grey-slate.displays.DP-2;
    displays = {
      DP-2 = {
        primary = true;
        refresh = 143.91;
        width = 2560;
        height = 1440;
        vrr = true;
      };
      DP-3 = {
        refresh = 59.98;
        width = 3840;
        height = 2160;
        x = -2560;
        vrr = "on-demand";
      };
    };
  };

  den.hosts.x86_64-linux.grey-slate = { inherit (config.hostConfig.grey-slate) displays primaryDisplay; };
  den.aspects.grey-slate = {
    includes = with gabbro; [
      desktop
    ];

    nixos = 
      { pkgs, config, ...}:
      {
        imports = with inputs; [
          nixos-hardware.nixosModules.common-cpu-amd
          nixos-hardware.nixosModules.common-pc-ssd
        ];

        hardware = {
          enableAllFirmware = true;
          firmware = [ pkgs.linux-firmware ];
          cpu.amd.updateMicrocode = config.hardware.enableRedistributableFirmware;
          graphics.enable = true;
          nvidia = {
            modesetting.enable = true;
            powerManagement.enable = true;
            powerManagement.finegrained = false;
            open = false;
            nvidiaSettings = true;
            package = config.boot.kernelPackages.nvidiaPackages.stable;
          };

          bluetooth = {
            enable = true;
            powerOnBoot = true;
            settings = {
              General = {
                Experimental = true;
                FastConnectable = true;
              };
            };
          };
        };

        programs.firefox.enable = true;

        
        boot = {
          kernelPackages = inputs.nix-cachyos-kernel.legacyPackages.${pkgs.stdenv.hostPlatform.system}.linuxPackages-cachyos-latest;
          initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
          initrd.kernelModules = [ ];
          kernelModules = [ "kvm-amd" ];
          extraModulePackages = [ ];
        };

        security = {
          rtkit.enable = true;
          sudo.extraConfig = "Defaults timestamp_timeout=30";  
        };

        virtualisation.docker.enable = true;
        users.users.nathaniel.extraGroups = [ "docker" ];

        networking = {
          hostName = "grey-slate";
          networkmanager.enable = true;
        };
      };
  };
}