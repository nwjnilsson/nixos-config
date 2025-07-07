{
  config,
  pkgs,
  ...
}: {
  imports = [
    <home-manager/nixos>
  ];

  services = {
    xserver = {
      enable = true;
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          rofi
          i3status
          pamixer # control audio
          # i3blocks
        ];
      };
      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
        };
      };
    };
    displayManager = {
      defaultSession = "xfce+i3";
    };
  };

  security.pam.services = {
    i3lock.enable = true;
    i3lock-color.enable = true;
    xlock.enable = true;
    xscreensaver.enable = true;
  };

  home-manager.users.johannes = {pkgs, ...}: {
    # xsession.windowManager.i3 = {
    #   enable = true;
    #   #package = pkgs.i3-gaps;
    # };
    home.file = {
      ".config/i3" = {
        source = builtins.path {
          path = ../../dotfiles/i3;
          name = "i3";
        };
        recursive = true;
      };
      ".config/i3status" = {
        source = builtins.path {
          path = ../../dotfiles/i3status;
          name = "i3status";
        };
        recursive = true;
      };
    };
  };
}
