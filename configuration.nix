{ config, pkgs, inputs, ... }:

{
  imports =
    [
      # << Hardware Configuration >>
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # Experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Network proxy
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = false;
  services.connman = {
    enable = true;
    #extraConfig = "";
  };

  # Time zone.
  time.timeZone = "America/Sao_Paulo";

  # Internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Console keymap
  console.keyMap = "us";

  # User account
  users.users.fhraze = {
    isNormalUser = true;
    description = "Fhraze";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Custom kernel
  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;

  # Packages installed in system profile.
  environment.systemPackages = with pkgs; [
    linuxKernel.packages.linux_xanmod_latest.v4l2loopback
    # linuxKernel.packages.linux_xanmod_latest.virtualbox # VirtuaBox Kernel Modules
    # linuxKernel.packages.linux_xanmod_latest.virtualboxGuestAdditions # VirtualBox extras
    # linuxKernel.packages.linux_xanmod_latest.vmware # VMWare Kernel Modules
    wget
    git
  ];

  # System sound
  hardware.pulseaudio.enable = false;
  sound.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    wireplumber.enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # man configuration.nix or on https://nixos.org/nixos/options.html for more options
  system.stateVersion = "23.11";

}
