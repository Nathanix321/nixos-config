{ den, __findFile, ... }:
{
  gabbro = {
    workstation = den.lib.parametric.atLeast {
      includes = [
        <gabbro/kde>
        <gabbro/printing>
        <gabbro/ssh>
        <gabbro/sleep>
        <gabbro/touchpad>
        <gabbro/xserver>
      ];
    };
    desktop = den.lib.parametric.atLeast {
      includes = [
          <gabbro/workstation>
      ];
    };
  };
}
