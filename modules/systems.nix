{ den, __findFile, ... }:
{
  gabbro = {
    workstation = den.lib.parametric.atLeast {
      includes = [
        <gabbro/boot/secure>
        <gabbro/boot/graphical>
        <gabbro/kde>
        <gabbro/printing>
        <gabbro/ssh/client>
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
