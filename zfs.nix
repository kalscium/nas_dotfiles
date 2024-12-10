{
  # Import the zfs pool at boot
  boot.zfs.extraPools = [ "home-nas" ];

  # ZFS Configurations
  services.zfs = {
    autoScrub.enable = true;
    trim.enable = true;
  };

  # Pool Mountpoints
  fileSystems."/home-nas" = {
    device = "home-nas";
    fsType = "zfs";
  };
}
