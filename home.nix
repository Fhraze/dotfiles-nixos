# \n

{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "fhraze";
  home.homeDirectory = "/home/fhraze";

  home.stateVersion = "23.11";

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.fd
    pkgs.gh
    pkgs.vscodium
    pkgs.ungoogled-chromium
    pkgs.alacritty
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {

  };

  # Home variables
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    # nvidiaPatches = true;
  };

  # Waybar
  programs.waybar = {
    # enable = true;
    # settings = {};
    # style = "";
  };

  # Dunst (notifications service)
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
	follow = "none";
	width = 500;
	height = 350;
	font = "Monospace 15";
	frame_width = 1;
	corner_radius = 15;
	gap_size = 3;
      };
      urgency_low = {
        timeout = 4;
	background = "#000000";
	foreground = "#B1B1B1";
	frame_color = "#FFFFFF#";
      };
      urgency_normal = {
        timeout = 8;
	background = "#000000";
	foreground = "#FFFFFF";
	frame_color = "#FFFFFF#";
      };
      urgency_critical = {
        timeout = 0;
	background = "#000000";
	foreground = "#FF8F00";
	frame_color = "#FFFFFF#";
      };
    };
  };

  # Z Shell
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    initExtra =
      "zstyle ':completion:*' menu select\n" +
      "zstyle ':completion:complete:*' gain privileges 1\n" +
      "\ntypeset -U path PATH\n" +
      "path=(~/.local/bin ~/.cargo/bin $path)\n" +
      "export path\n" +
      "\nalias sudo='doas'\n" +
      "alias ls='eza'\n" +
      "alias find='fd'\n" +
      "alias grep='rg'\n" +
      "\neval \"$(zoxide init --cmd cd zsh)\"";
  };

  # Starship
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      right_format = "$cmd_duration";
      format = "$username$hostname$directory$line_break$character";
      character = {
        success_symbol = "[  ╰](bold fg:#FFFFFF)[∙](bold fg:#FFFFFF)[](bold fg:#FFFFFF)";
        error_symbol = "[  ╰](bold fg:#FFFFFF)[x](fg:#FFFFFF)[](bold fg:#FFFFFF)";
      };
      package = { disabled = true; };
      hostname = {
        ssh_only = false;
        format =  "[・](bold fg:#FFFFFF)[ $hostname](bold fg:#FFFFFF)[・](bold fg:#FFFFFF)";
        trim_at = ".companyname.com";
        disabled = false;
      };
      username = {
        style_user = "bold fg:#FFFFFF";
        style_root = "bold fg:#FFFFFF";
        format = "[・]($style)[ $user]($style)";
        disabled = false;
        show_always = true;
      };
      directory = {
        home_symbol = " ";
        read_only = "  ";
        style = "bold fg:#FFFFFF";
        truncation_length = 2;
        truncation_symbol = "./";
        format = "[$path]($style)[・]($style)";
      };
      directory.substitutions = {
        "Documents" = " ";
        "Downloads" = " ";
        "Music" = "󰝚 ";
        "Playlists" = "󰲸 ";
        "Pictures" = " ";
        "Games" = " ";
        "Videos" = " ";
        "Desktop" = " ";
        "Books" = " ";
        "Android" = "󰀲 ";
      };
      line_break = { disabled = false; };
      cmd_duration = {
        min_time = 0;
        format = "[・](bold fg:#FFFFFF)[󰄉 time:$duration](bold fg:#FFFFFF)[・](bold fg:#FFFFFF)";
      };
    };
  };

  # Zoxide (nice cd)
  programs.zoxide.enable = true;

  # Eza (nice ls)
  programs.eza = {
    enable = true;
    icons = true;
  };

  # Ripgrep (nice grep)
  programs.ripgrep.enable = true;
}
