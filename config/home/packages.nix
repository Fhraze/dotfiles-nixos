{ pkgs, config, username, host, ... }:

let 
  inherit (import ../../hosts/${host}/options.nix) 
    browser wallpaperDir wallpaperGit flakeDir;
in {
  # Install Packages For The User
  home.packages = with pkgs; [
    #pkgs."${browser}" # MANAGED BY ./ungoogled-chromium.nix
    htop
    cmatrix
    cowsay
    cava
    peaclock
    clolcat
    blahaj
    scrcpy
    libarchive
    droidcam
    qpwgraph
    bitwarden
    yt-dlp
    #owofetch
    xfce.thunar
    gvfs
    qbittorrent
    hyprnome

    # << Dev >>
    libexecinfo
    mono
    #epoll-shim
    ninja
    clang
    cmake
    libgcc
    jdk
    lua
    python3
    typescript
    nodePackages.nodejs

    # << Office >>
    obsidian
    libsForQt5.okular
    onlyoffice-bin
    davinci-resolve
    krita
    gimp-with-plugins

    # << Gaming >>
    lutris
    gogdl
    heroic

    # << Wine >>
    wine-wayland
    winetricks

    # << proton >>
    protonup-qt
    protontricks

    viewnior
    #discord
    vesktop
    signal-desktop
    libvirt
    libinput
    swww
    swaybg
    grim
    slurp
    gnome.file-roller
    swaynotificationcenter
    #rofi-wayland
    wofi
    wofi-emoji
    imv
    transmission-gtk
    mpv
    gimp
    #obs-studio # MANAGED BY ./obs-studio.nix
    rustup
    #audacity
    tenacity
    pavucontrol
    tree
    #spotify
    swayidle
    neovide
    swaylock

    # << Fonts >>
    (nerdfonts.override { fonts = [ "Hack" ]; }) #JetBrainsMono
    twemoji-color-font
    hachimarupop # japanese
    hannom # chinese
    baekmuk-ttf # korean
    vazir-fonts # persian
    # Import Scripts
    (import ./../scripts/emopicker9000.nix { inherit pkgs; })
    (import ./../scripts/task-waybar.nix { inherit pkgs; })
    (import ./../scripts/squirtle.nix { inherit pkgs; })
    (import ./../scripts/wallsetter.nix { inherit pkgs; inherit wallpaperDir;
      inherit username; inherit wallpaperGit; })
    (import ./../scripts/themechange.nix { inherit pkgs; inherit flakeDir; inherit host; })
    (import ./../scripts/theme-selector.nix { inherit pkgs; })
    (import ./../scripts/nvidia-offload.nix { inherit pkgs; })
    (import ./../scripts/web-search.nix { inherit pkgs; })
    (import ./../scripts/rofi-launcher.nix { inherit pkgs; })
    (import ./../scripts/screenshootin.nix { inherit pkgs; })
    (import ./../scripts/list-hypr-bindings.nix { inherit pkgs; inherit host; })
    (import ./../scripts/kb-switch.nix { inherit pkgs; })
    (import ./../scripts/record-script.nix { inherit pkgs; })
  ];

  programs.gh.enable = true;
}
