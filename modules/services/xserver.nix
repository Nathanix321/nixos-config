{
  gabbro.xserver.nixos =
    { pkgs, ... }:
    {
      # You can disable this if you're only using the Wayland session.
      services.xserver = {
        enable = true;
        videoDrivers = ["nvidia"];
        xkb = {
          layout = "us";
          variant = "altgr-intl";
        };
      };
    };
}