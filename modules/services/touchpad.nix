{
  gabbro.touchpad.nixos = 
    { pkgs, ... }:
    {
      services.libinput = {
        enable = true;
      };
    };
}