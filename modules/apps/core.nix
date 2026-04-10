{
  styx.apps._.coreutils.homeManager =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        difftastic
        git
        just
        wget
      ];
    };
}
