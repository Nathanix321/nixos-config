{
  gabbro.printing.nixos = 
    { pkgs, ... }:
    {
      services.printing = {
        enable = true;
      };
    };
}