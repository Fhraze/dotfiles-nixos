{ config, pkgs, ... }:

{
  # << Packages >>
  home.packages = [
    pkgs.swaybg
    pkgs.wofi-emoji
    #pkgs.hyprland
    #pkgs.wlroots
    pkgs.wl-clipboard
    pkgs.wf-recorder
    pkgs.grim
    pkgs.slurp
    pkgs.hyprnome
    #pkgs.xwayland
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
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    #nvidiaPatches = true;
    settings = {
      input = {
        # Mouse
        #accel_profile = "adaptive";
        force_no_accel = false;
        #sensitivity = 0;

        # Keyboard
        kb_layout = "br";
        repeat_rate = 60; # default 25
        repeat_delay = 300; # default 600
        follow_mouse = 1;
        # 0 - Cursor won't change focus
        # 1 - Cursor will always change focus
        # 2 - Cursor detached from kb focus, clicking will move kb focus
        # 3 - Cursor won't change keyboard focus
        numlock_by_default = true;

        touchpad = {
          natural_scroll = "yes";
          disable_while_typing = true;
          clickfinger_behavior = true;
          scroll_factor = 0.7;
        };
        scroll_method = "2fg";
      };

      gestures = {
        workspace_swipe = true;
        #workspace_swipe_distance = 1200;
        workspace_swipe_fingers = 4;
        workspace_swipe_cancel_ratio = 0.2;
        workspace_swipe_min_speed_to_force = 5;
        workspace_swipe_create_new = true;
      };

      general = {
        # Monitors
        #monitor = "DP-1, 1920x1080, 0x0, 1";
        #monitor = "HDMI-A-1, 2560x1080, 1920x0, 1";

        # Mouse
        cursor_inactive_timeout = 2;
        no_cursor_warps = false;

        # Gaps and border
        gaps_in = 8; # between windows
        gaps_out = 15;
        border_size = 3;

        # Colors
        col.active_border = "rgba(FF0062FF) rgba(FF5898FF) rgba(FF82B2FF) 45deg";
        col.inactive_border = "rgba(040404aa)";

        # Functionality
        # resize_on_border = true;
        layout = "dwindle";
      };

      dwindle = {
	preserve_split = true; # you probably want this
	#no_gaps_when_only = true;
      };

      decoration = {
	# Blur rules
	rounding = 20;

        blur = {
          enabled = "yes";
          popups = false; # wheather to blur popups
          size = 7;
          passes = 4;
          new_optimizations = "on";
          ignore_opacity = false;
        };
        # Shadow
        drop_shadow = "no";
        shadow_range = 30;
        shadow_render_power = 3;
        col.shadow = "rgba(01010166)";

        # Dim
        dim_inactive = false;
        dim_strength = 0.1;
        dim_special = 0;
      };

      animations = {
        enabled = "yes";
        bezier = "stolen, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, stolen"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      misc = {
        vfr = true;
        vrr = 0;
        focus_on_activate = true;
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        #suppress_portal_warnings = true;
        enable_swallow = true;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      xwayland = {
        use_nearest_neighbor = true;
        force_zero_scaling = false;
      };

      # Window Rules
      windowrule = [
        "float, ^(steam)$"
        "float, ^(guifetch)$"
        "float,title:^(Open File)(.*)$"
        "float,title:^(Open Folder)(.*)$"
        "float,title:^(Save As)(.*)$"
        "float,title:^(Library)(.*)$"
      ];
      windowrulev2 = "rounding 17, floating:1";

      # Layer Rules
      layerrule = [
        "blur, gtk-layer-shell"
        "ignorezero, gtk-layer-shell"
        "blur, notifications"
        "ignorezero, notifications"
      ];

      # << Keybinds >>
      bind = [
        # Apps
        "SUPER, Return, exec, alacritty"
        "SUPER, E, exec, thunar"

        # Functionality
        "SUPERSHIFT, E, exec, killall Hyprland #eww"
        "SUPER, R, exec, wofi --show drun #--allow-images"
        "SUPER, S, exec, wofi-emoji"
        "SUPER, C, killactive,"
        "SUPERSHIFT, C, exec, hyprctl kill"
        "SUPER, mouse:274, togglefloating"

        # Swap windows
        "SUPERSHIFT, left, movewindow, l"
        "SUPERSHIFT, right, movewindow, r"
        "SUPERSHIFT, up, movewindow, u"
        "SUPERSHIFT, down, movewindow, d"
        # Move focus
        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"
        "SUPER, J, movefocus, l"
        "SUPER, K, movefocus, r"

        # Window split ratio pt1
        "SUPER, Minus, splitratio, -0.1"
        "SUPER, Equal, splitratio, 0.1"

        # Fullscreen
        "SUPER, F, fullscreen"

        # Switching
        "SUPER, mouse_up, exec, hyprnome --previous"
        "SUPER, mouse_down, exec, hyprnome"
        "SUPERSHIFT, mouse_up, exec, hyprnome --previous --move"
        "SUPERSHIFT, mouse_down, exec, hyprnome --move"
      ];
      binde = [
        # Window split ration pt2
        "SUPER, Semicolon, splitratio, -0.1"
        "SUPER, Apostrophe, splitratio, 0.1"
      ];
      bindm = [
        # Move/resize windows with Super + LMB/RMB and dragging
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
        "SUPER, mouse:274, movewindow"
        #"SUPER, Z, movewindow"
      ];

      # << Environment conf >>
      env = [
        "XMODIFIERS, @im=ibus"
        "GTK_IM_MODULE, ibus"
        "QT_IM_MODULE, ibus"
        "QT_QPA_PLATFORMTHEME, qt5ct"
        "WLR_NO_HARDWARE_CURSORS, 1"
      ];

      # << Execs conf >>
      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
	#"waybar &"
	"dunst &"
	# << Wallpapers >>
        "swaybg -m fill -o 'HDMI-A-1' -i ~/.dotfiles/modules/wm/hyprland/wallpapers/OuterWildsUW.jpg &"
        "swaybg -m fill -o 'DP-1' -i ~/.dotfiles/modules/wm/hyprland/wallpapers/OuterWildsEye.jpg &"
      ];
    };
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
