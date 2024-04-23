# PLEASE READ THE WIKI FOR DETERMINING
# WHAT TO PUT HERE AS OPTIONS. 
# https://gitlab.com/Zaney/zaneyos/-/wikis/Setting-Options

let
  setUsername = "fhraze";
  setHostname = "nixos";
in {
  # No Change Needed Below
  username = "${setUsername}";
  hostname = "${setHostname}";
  userHome = "/home/${setUsername}";
  flakeDir = "/home/${setUsername}/.dotfiles";
  wallpaperGit = "https://gitlab.com/Zaney/my-wallpapers.git"; # Can be changed IF you know what your doing
  wallpaperDir = "/home/${setUsername}/Pictures/Wallpapers";
  screenshotDir = "/home/${setUsername}/Pictures/Screenshots";
  flakePrev = "/home/${setUsername}/.nixos-previous";
  flakeBackup = "/home/${setUsername}/.nixos-backup";

  # Git Configuration ( For Pulling Software Repos )
  gitUsername = "Fhraze";
  gitEmail = "bcfrazao@gmail.com";

  # Base16 Theme
  theme = "pinky";

  # Hyprland Settings
  borderAnim = false; # Enable / Disable Hyprland Border Animation
  extraMonitorSettings = "";

  # Waybar Settings
  waybarAnim = true; # Enable / Disable Waybar Animation CSS
  bar-number = false; # Enable / Disable Workspace Numbers In Waybar

  # System Settings
  clock24h = true;
  theLocale = "en_US.UTF-8";
  theKBDLayout = "br";
  theSecondKBDLayout = "us";
  theKBDVariant = "";
  theLCVariables = "pt_BR.UTF-8";
  theTimezone = "America/Sao_Paulo";
  theShell = "zsh"; # Possible options: bash, zsh
  theKernel = "xanmod"; # Possible options: default, latest, lqx, xanmod, zen
  sdl-videodriver = "x11"; # Either x11 or wayland ONLY. Games might require x11 set here
  # For Hybrid Systems intel-nvidia
  # Should Be Used As gpuType
  cpuType = "intel";
  gpuType = "amd";

  # Nvidia Hybrid Devices ONLY NEEDED FOR HYBRID SYSTEMS! 
  intel-bus-id = "PCI:1:0:0";
  nvidia-bus-id = "PCI:0:2:0";

  # Enable / Setup NFS
  nfs = false;
  nfsMountPoint = "/mnt/nas";
  nfsDevice = "nas:/volume1/nas";

  # NTP & HWClock Settings
  ntp = true;
  localHWClock = false;

  # Enable Printer & Scanner Support
  printer = true;

  # Program Options
  browser = "ungoogled-chromium"; # Install & Set Default Browser
  terminal = "alacritty";  # Set Default System Terminal
  distrobox = false;
  flatpak = false;
  kdenlive = false;
  blender = true;
  enableZeroAD = false;

  # Enable Support For
  # Logitech Devices
  logitech = false;

  # Enable Terminals ( If You Disable All You Get Kitty )
  wezterm = false;
  alacritty = true;
  kitty = false;

  # Enable Python & PyCharm
  python = false;
  
  # Enable SyncThing
  syncthing = true;

}
