{ config, pkgs, ... }:

{
  # << Packages >>
  home.packages = [
    pkgs.swaybg
    pkgs.wofi-emoji
    pkgs.hyprland
    pkgs.wlroots
    pkgs.wl-clipboard
    pkgs.wf-recorder
    pkgs.grim
    pkgs.slurp
    pkgs.hyprnome
    pkgs.xwayland
    pkgs.xwaylandvideobridge
  ];

  # Home variables
  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  # << GTK Theming >>
  gtk = {
    enable = true;
    cursorTheme.name = "Adwaita";
    cursorTheme.package = pkgs.gnome.adwaita-icon-theme;
    theme.name = "adw-gtk3-dark";
    theme.package = pkgs.adw-gtk3;
  };

  # << Hyprland >>
  #wayland.windowManager.hyprland = {
  #  enable = true;
  #  xwayland.enable = true;
  #  # nvidiaPatches = true;
  #};
  home.file.".config/hypr/" = {
    source = ./hyprland;
    recursive = true;
  };

  # << XDG portals >>
  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = [
          "xdpg"
	  "gtk"
	];
	"org.freedesktop.portal.FileChooser" = [ "xdg-desktop-portal-gtk" ];
      };
    };
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  # << Wofi >>
  programs.wofi = {
    enable = true;
    settings = {
      allow_images = true;
    };
    style = ''
    *{
        font-family: liberation mono;
    }

    window {
        border-radius: 20px;
        background-color: #FFFFFF;
    }

    #input {
        margin: 5px;
        border-radius: 0px;
        border: none;
        border-bottom: 3px solid black;
        background-color: #000000;
        color: white;
    }

    #inner-box {
        background-color: #000000;
    }

    #outer-box {
        margin: 3px;
        padding: 10px;
        border-radius: 20px;
        background-color: #000000;
    }

    #scroll {
    }

    #text {
        padding: 5px;
        color: white;
    }

    #entry:nth-child(even){
        background-color: #000000;
    }

    #entry:selected {
        background-color: #FF0062;
    }

    #text:selected {
    }
    '';
  };
}
