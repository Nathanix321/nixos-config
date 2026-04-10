{
  gabbro.wayland._.base =
    { host, ... }:
    {
      nixos =
        { pkgs, lib, ... }:
        {
          programs = {
            dconf.enable = true;
            appimage = {
              enable = true;
              binfmt = true;
            };
          };
          environment = {
            systemPackages = [ pkgs.wl-clipboard ];
            sessionVariables = {
              NIXOS_OZONE_WL = "1";
              XCURSOR_SIZE = lib.mkForce (builtins.ceil (32 * host.primaryDisplay.scaling));
            };
          };
        };

      homeManager =
        { config, ... }:
        {
          qt.enable = true;
          gtk = {
            enable = true;
            gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
            gtk3.bookmarks = [
              "file:///home/nathaniel/Downloads Downloads"
              "file:///home/nathaniel/Documents Documents"
              "file:///home/nathaniel/Pictures Pictures"
              "file:///home/nathaniel/Videos Videos"
              "file:///home/nathaniel/Games Games"
            ];
          };
        };
    };
}
