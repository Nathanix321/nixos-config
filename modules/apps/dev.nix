{
  gabbro.dev.homeManager =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        # Dev
        jq
      ];
    };
}
