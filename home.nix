{ config, pkgs, ... }:

{
  # Modules
  imports =
    [
      # << Shells >>
      ./modules/shell/zsh.nix

      # << Services >>
      ./modules/service/dunst.nix
      #./modules/service/openssh.nix
      ./modules/service/rtorrent.nix
      ./modules/services/syncthing.nix

      # << Virtual Machine Software >>
      ./modules/vm/waydroid.nix

      # << Window Managers >>
      ./modules/wm/hyprland.nix

      # << Desktop Environments >>
      #./modules/de/gnome.nix

      # << Other Software >>
      ./modules/neovim.nix
      ./modules/opendoas.nix
      ./modules/ungoogled-chromium.nix
      ./modules/vscodium.nix
      ./modules/steam.nix
      ./modules/obs-studio.nix
      ./modules/thunar.nix
      ./modules/alacritty.nix
      ./modules/htop.nix
    ];

  home.username = "fhraze";
  home.homeDirectory = "/home/fhraze";

  home.stateVersion = "23.11";

  home.packages = [
    # << Fun >>
    pkgs.cmatrix
    pkgs.cowsay
    pkgs.ponysay
    pkgs.cava
    pkgs.peaclock
    #pkgs.lolcat
    pkgs.clolcat
    #pkgs.blahaj
    #pkgs.sl

    # << Tools >>
    pkgs.gh
    pkgs.scrcpy
    pkgs.peazip
    pkgs.droidcam
    pkgs.qpwgraph
    pkgs.bitwarden
    pkgs.yt-dlp
    pkgs.pavucontrol
    # System fetch tool
    pkgs.owofetch

    # << Dev Tools >>
    pkgs.mono # Open-source .NET framework for C#
    pkgs.libgcc # C and C++
    pkgs.clang
    pkgs.python3
    pkgs.lua
    pkgs.jdk # Latest stable Java
    pkgs.typescript
    pkgs.nodePackages.nodejs
    # Rust...
    pkgs.rustc
    pkgs.cargo
    pkgs.rustfmt
    #pkgs.rustpython

    # << Social >>
    pkgs.vesktop
    pkgs.signal-desktop

    # << Office >>
    pkgs.obsidian
    pkgs.libsForQt5.okular
    pkgs.onlyoffice-bin
    #pkgs.libreoffice-bin
    pkgs.davinci-resolve
    pkgs.tenacity
    pkgs.blender
    pkgs.krita
    pkgs.gimp-with-plugins
    pkgs.rustdesk

    # << Media Viewers/Players >>
    pkgs.mpv
    pkgs.viewnior

    # << Gaming >>
    pkgs.lutris
    pkgs.heroic
    pkgs.gogdl # GOG dl module for Heroic

    # << Wine >>
    #pkgs.wineWow64Packages.waylandFull # wine wayland 64bit
    pkgs.wine-wayland # default wine wayland
    #pkgs.wine
    #pkgs.wine-staging
    pkgs.winetricks

    # << Proton >>
    pkgs.protontricks
    pkgs.protonup-qt
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hack" ]; }) # hack nerd font
    twemoji-color-font # emoji
    hachimarupop # japanese font
    hannom # chinese font
    baekmuk-ttf # korean font
    vazir-fonts # persian font
  ];

  home.file = {
    
  };

  # Home variables
  home.sessionVariables = {
    
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Keymap
  services.xserver = {
    xkb.layout = "br";
    xkb.variant = "";
  };
}
