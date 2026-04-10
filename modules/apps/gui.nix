{ inputs, ... }:
{
  gabbro.apps._.gui.homeManager =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        libreoffice
        obsidian
        orca-slicer
        freecad
        gearlever
        (pkgs.discord.override {
          withOpenASAR = true;
          enableAutoscroll = true;
          withMoonlight = true;
          moonlight = inputs.moonlight.packages.${pkgs.stdenv.hostPlatform.system}.default;
        })
      ];
    };
}
