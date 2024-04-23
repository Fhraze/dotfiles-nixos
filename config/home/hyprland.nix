{ pkgs, config, lib, inputs, host, ... }:

let
  theme = config.colorScheme.palette;
  hyprplugins = inputs.hyprland-plugins.packages.${pkgs.system};
  inherit (import ../../hosts/${host}/options.nix) 
    browser cpuType gpuType
    wallpaperDir borderAnim
    theKBDLayout terminal
    theSecondKBDLayout
    theKBDVariant sdl-videodriver
    extraMonitorSettings;
in with lib; {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    plugins = [
      # hyprplugins.hyprtrails
    ];
    extraConfig = let
      modifier = "SUPER";
    in concatStrings [ ''
      monitor=,preferred,auto,1
      ${extraMonitorSettings}
      input {
        # Mouse
        #accel_profile = adaptive
        force_no_accel = false
        #sensitivity = 0

        # Keyboard
        kb_layout = br
        repeat_rate = 60 # default 25
        repeat_delay = 300 # default 600
        follow_mouse = 1
        # 0 - Cursor won't change focus
        # 1 - Cursor will always change focus
        # 2 - Cursor detached from kb focus, clicking will move kb focus
        # 3 - Cursor won't change keyboard focus
        numlock_by_default = true

        touchpad {
          natural_scroll = yes
          disable_while_typing = true
          clickfinger_behavior = true
          scroll_factor = 0.7
        }
        scroll_method = 2fg
      }

      gestures {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        workspace_swipe = true
        #workspace_swipe_distance = 1200
        workspace_swipe_fingers = 4
        workspace_swipe_cancel_ratio = 0.2
        workspace_swipe_min_speed_to_force = 5
        workspace_swipe_create_new = true
      }

      #workspace = 1, monitor:HDMI-A-1
      #workspace = 2, monitor:HDMI-A-1
      #workspace = 3, monitor:HDMI-A-1
      #workspace = 4, monitor:HDMI-A-1
      #workspace = 5, monitor:HDMI-A-1

      general {
        # Monitors
        #monitor=DP-1, 1920x1080, 0x0, 1
        #monitor=HDMI-A-1, 2560x1080, 1920x0, 1

        # Mouse
        cursor_inactive_timeout = 2
        no_cursor_warps = false

        # Gaps and border
        gaps_in = 8 # between windows
        gaps_out = 15
        border_size = 3

        # Fallback colors
        col.active_border = rgba(FF0062FF) rgba(FF5898FF) rgba(FF82B2FF) 45deg
        col.inactive_border = rgba(040404aa)

        # Functionality
        # resize_on_border = true
        layout = dwindle
      }

      dwindle {
	preserve_split = true # you probably want this
	#no_gaps_when_only = true
      }

      decoration {
	# Blur rules
        rounding = 20

        # Blur
        blur {
          enabled = yes
          popups = false # wheather to blur popups
          size = 7
          passes = 4
          new_optimizations = on
          ignore_opacity = false
          #noise = 0.0 - 1.0
          #contrast = 0.0 - 2.0
          #brightness 0.0 - 2.0
          #vibrancy = 0.0 - 1.0
          #vibrancy_darkness = 0.0 - 1.0
        }
        # Shadow
        drop_shadow = no
        shadow_range = 30
        shadow_render_power = 3
        col.shadow = rgba(01010166)

        # Dim
        dim_inactive = false
        dim_strength = 0.1
        dim_special = 0
      }

      animations {
        enabled = yes

        # Animation curves
        bezier = stolen, 0.05, 0.9, 0.1, 1.05

        # Animation configs
        # "name, on/off, speed, curve, style(optional) 0-100%(size)"
        animation = windows, 1, 7, stolen
        animation = windowsOut, 1, 7, default, popin 80%
        animation = border, 1, 10, default
        animation = borderangle, 1, 8, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 6, default
      }

      misc {
        vfr = true
        vrr = 0
        focus_on_activate = true
	animate_manual_resizes = true
	animate_mouse_windowdragging = true
	#suppress_portal_warnings = true
	enable_swallow = true
        disable_hyprland_logo = true
        disable_splash_rendering = true
      }

      xwayland {
        use_nearest_neighbor = true
        force_zero_scaling = false
      }

      # Window Rules
      windowrule = float, ^(steam)$
      windowrule = float, ^(guifetch)$

      # Dialogs
      windowrule=float,title:^(Open File)(.*)$
      windowrule=float,title:^(Open Folder)(.*)$
      windowrule=float,title:^(Save As)(.*)$
      windowrule=float,title:^(Library)(.*)$
      windowrulev2 = rounding 17, floating:1

      # Layer Rules
      layerrule = blur, gtk-layer-shell
      layerrule = ignorezero, gtk-layer-shell
      layerrule = blur, notifications
      layerrule = ignorezero, notifications

      # Environment
      env = XMODIFIERS, @im=ibus
      env = GTK_IM_MODULE, ibus
      env = QT_IM_MODULE, ibus
      env = QT_QPA_PLATFORMTHEME, qt5ct
      env = WLR_NO_HARDWARE_CURSORS, 1

      # Execs
      exec-once = $POLKIT_BIN
      exec-once = dbus-update-activation-environment --systemd --all
      exec-once = systemctl --user import-environment QT_QPA_PLATFORMTHEME WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      #exec-once = swww init
      exec-once = waybar
      exec-once = swaync
      exec-once = dunst &
      #exec-once = wallsetter
      exec-once = nm-applet --indicator
      exec-once = libinput-gestures-setup start
      exec-once = hyprctl setcursor Bibata-Modern-Classic 24
      #exec-once = swayidle -w timeout 720 'swaylock -f' timeout 800 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' before-sleep 'swaylock -f -c 000000'
      # << Wallpapers >>
      exec-once = swaybg -m fill -o "HDMI-A-1" -i ~/Pictures/Wallpapers/OuterWildsUW.jpg &
      exec-once = swaybg -m fill -o "DP-1" -i ~/Pictures/Wallpapers/OuterWildsEye.jpg &

      # << Keybinds >>
      # Apps
      bind = SUPER, Return, exec, alacritty
      bind = SUPER, E, exec, thunar
      #bind = SUPER, M, exec, audacious

      # Functionality
      bind = SUPERSHIFT, E, exec, killall Hyprland
      bind = SUPER, R, exec, wofi --show drun --allow-images
      bind = SUPER, S, exec, wofi-emoji
      bind = SUPER, C, killactive,
      bind = SUPERSHIFT, C, exec, hyprctl kill
      bind = SUPER, mouse:274, togglefloating
      bind = SUPER, Space, exec, kb-switch
      bind = SUPERSHIFT, S, exec, screenshootin
      bind = SUPERSHIFT, R, exec, record-script

      # Swap windows
      bind = SUPERSHIFT, left, movewindow, l
      bind = SUPERSHIFT, right, movewindow, r
      bind = SUPERSHIFT, up, movewindow, u
      bind = SUPERSHIFT, down, movewindow, d
      # Move focus
      bind = SUPER, left, movefocus, l
      bind = SUPER, right, movefocus, r
      bind = SUPER, up, movefocus, u
      bind = SUPER, down, movefocus, d
      #bind = SUPER, J, movefocus, l
      #bind = SUPER, K, movefocus, r

      # Window split ratio
      binde = SUPER, Minus, splitratio, -0.1
      binde = SUPER, Equal, splitratio, 0.1
      #binde = SUPER, Semicolon, splitratio, -0.1
      #binde = SUPER, Apostrophe, splitratio, 0.1

      # Fullscreen
      bind = SUPER, F, fullscreen

      # Switching workspaces
      bind = SUPER, mouse_up, exec, hyprnome --previous
      bind = SUPER, mouse_down, exec, hyprnome
      bind = SUPERSHIFT, mouse_up, exec, hyprnome --previous --move
      bind = SUPERSHIFT, mouse_down, exec, hyprnome --move

      # Move/resize windows with Super + LMB/RMB and dragging
      bindm = SUPER, mouse:272, movewindow
      bindm = SUPER, mouse:273, resizewindow
      #bindm = SUPER, mouse:274, movewindow
    '' ];
  };
}
