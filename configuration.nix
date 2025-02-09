{ pkgs, ... }:
{
  imports = [
    # Include the results of the hardware scan
    ./hardware-configuration.nix
  ];

  # Bootloader
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };

    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };

  boot.supportedFilesystems = [ "ext4" "ntfs" "btrfs" "zfs" ];

  # Networking
  networking = {
    hostName = "kalver"; # Defines your hostname
    hostId = "e1f6e7af"; # Defines your hostid
    useDHCP = true;
  };

  time.timeZone = "Australia/Melbourne"; # time zone

  # Select internationalisation properties
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  # Enable touchpad support
  services.libinput.enable = true;

  system.stateVersion = "24.11";

  # Enable flakes and nix command
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Environmental Packages
  environment.systemPackages = with pkgs; [
    git
    helix
    parted
    jmtpfs

    # for mount iOS devices
    ifuse
    libimobiledevice
  ];

  # Enable support for iOS devices
  services.usbmuxd.enable = true;

  # Environmental Variables
  environment.variables = { };
}
