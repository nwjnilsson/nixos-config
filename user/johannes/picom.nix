{
  config,
  pkgs,
  lib,
  ...
}: let
  isGlx = config.home-manager.users.johannes.services.picom.backend == "glx";
in {
  home-manager.users.johannes.services.picom = {
    enable = true;
    # Override backend on a per-machine basis, as glx has certain graphics requirements
    backend = lib.mkDefault "xrender";

    vSync = true;
    settings = {
      opacity-rule = [
        "99:fullscreen"
        "95:class_g = 'Alacritty' && focused"
        "65:class_g = 'Alacritty' && !focused"
      ];
      inactive-opacity = 1.0;
      active-opacity = 1.0;
      shadow = true;
      fade = true;
      fade-in-step = 0.03;
      fade-out-step = 0.03;
      blur =
        if isGlx
        then {
          method = "gaussian";
          size = 7;
          deviation = 5.0;
        }
        else {};
    };
  };
}
