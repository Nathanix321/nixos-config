{
  gabbro.xdg = {
    nixos.xdg.terminal-exec.enable = true;
    homeManager =
      { config, ... }:
      {
        xdg = {
          enable = true;
          autostart.enable = true;
          autostart.readOnly = true;
          userDirs = {
            enable = true;
            createDirectories = true;
            desktop = null;
            templates = null;
            music = null;
            publicShare = null;
          };
        };
        home.sessionVariables = {
          # cleaning up ~
          CARGO_HOME = "${config.xdg.dataHome}/cargo";
          LESSHISTFILE = "${config.xdg.cacheHome}/less/history";
          PYTHON_HISTORY = "${config.xdg.configHome}/python/history";
          WINEPREFIX = "${config.xdg.dataHome}/wine";
          XCOMPOSECACHE = "${config.xdg.cacheHome}/X11/xcompose";
        };
      };
  };
}
