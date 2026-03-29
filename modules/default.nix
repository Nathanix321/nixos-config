{ inputs, __findFile, ...}:
{
  den.default = {
    includes = [
      <den/home-manager>
      <den/define-user>
      (
        { host, ...}:
        {
          ${host.class}.networking.hostName = host.name;
        }
      )
    ];

    nixos =
      { pkgs, lib, ... }:
      {
        imports = with inputs; [
          srvos.nixosModules.desktop
          srvos.nixosModules.mixins-systemd-boot
        ];

        environment = {
          binsh = "${pkgs.dash}/bin/dash";
          defaultPackages = lib.mkForce [ ];
        };

        environment.systemPackages = with pkgs; [
          git
          vim
          just
          vscodium
        ];

        services.avahi.enable = false; # in favor of srvos mdns config
        documentation.doc.enable = false;
        documentation.info.enable = false;
        i18n.defaultLocale = "en_US.UTF-8";
        i18n.supportedLocales = [ "all" ];
        services.dbus.implementation = "broker";
        system.stateVersion = "25.11"; 
        time.timeZone = "America/New_York";
        zramSwap.enable = true;
        home-manager.useUserPackages = true;
        home-manager.useGlobalPkgs = true;
        boot.initrd.systemd.enable = true;
      };
    
    homeManager = {
      programs.home-manager.enable = true;
      home = {
        sessionPath = [ "$HOME/.local/bin" ];
        sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";
        stateVersion = "25.11";
      };
    };
  };
}