{ den, __findFile, ... }:
{
  gabbro = {
    workstation = den.lib.parametric.atLeast {
      includes = [
        <gabbro/printing>
        <gabbro/ssh>
        <gabbro/sleep>
        <gabbro/touchpad>
        <gabbro/theming>
        <gabbro/wayland/niri>
        <gabbro/xdg>
        <gabbro/flatpak>
      ];
    };
    desktop = den.lib.parametric.atLeast {
      includes = [
        <gabbro/workstation>
        <gabbro/performance/max>
      ];
    };
  };
}
