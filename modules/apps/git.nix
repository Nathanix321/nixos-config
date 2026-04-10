{ ... }:
{
  gabbro.apps._.git.homeManager =
    { lib, ... }:
    {
      programs = lib.mkMerge [
        {
          difftastic.enable = true;
          git = {
            enable = true;
            lfs.enable = true;
            signing = {
              format = "ssh";
              key = "~/.ssh/id_ed25519.pub";
              signByDefault = true;
            };
            settings = {
              user.name = "nathaniel";
              user.email = "letourneau.nathaniel@hotmail.com";
              init.defaultBranch = "main";
              pull.rebase = true;
              rerere.enabled = true;
              column.ui = "auto";
              fetch.prune = true;
              interactive.singlekey = true;
            };
          };
        }
      ];
    };
}
