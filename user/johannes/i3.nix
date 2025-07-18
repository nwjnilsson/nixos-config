{
  config,
  pkgs,
  ...
}: {
  imports = [
    <home-manager/nixos>
    ./picom.nix
  ];

  # Use xfce lock
  programs.i3lock.enable = false;

  services = {
    xserver = {
      enable = true;
      excludePackages = [
        pkgs.xterm
      ];
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          rofi # dmenu alternative
          i3status
          pamixer # control audio
          nitrogen # backgrounds for X
          # dex
          # i3blocks
          # xss-lock
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
    xscreensaver.enable = true;
  };

  home-manager.users.johannes = {
    config,
    pkgs,
    ...
  }: {
    xsession.windowManager.i3 = {
      enable = true;
      extraConfig = ""; # TODO: move config here
    };
    gtk = {
      enable = true;
      gtk3.extraConfig = {
        Settings = ''
          gtk-application-prefer-dark-theme=1
        '';
      };
      gtk4.extraConfig = {
        Settings = ''
          gtk-application-prefer-dark-theme=1
        '';
      };
    };

    home.file = {
      "${config.xdg.configHome}/i3" = {
        source = builtins.path {
          path = ../../dotfiles/i3;
          name = "i3";
        };
        recursive = true;
      };
      "${config.xdg.configHome}/i3status" = {
        source = builtins.path {
          path = ../../dotfiles/i3status;
          name = "i3status";
        };
        recursive = true;
      };
    };
  };
}
