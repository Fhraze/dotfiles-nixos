{config, pkgs, ...}:

{
  home.packages = [ pkgs.fd ];

  # Z Shell
  users.users.fhraze.shell = pkgs.zsh

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
