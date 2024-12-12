{
  # Import the zfs pool at boot
  boot.zfs.extraPools = [ "home-nas" ];

  # The datasets to decrypt on boot (none as blocking on boot is un-desired)
  boot.zfs.requestEncryptionCredentials = [];

  # ZFS Configurations
  services.zfs = {
    autoScrub.enable = true;
    trim.enable = true;
  };

  # Pool Mountpoints
  fileSystems."/mnt/FamilyPhotos" = {
    device = "home-nas/FamilyPhotos";
    fsType = "zfs";
  };
  fileSystems."/mnt/Garchive" = {
    device = "home-nas/Garchive";
    fsType = "zfs";
  };
  fileSystems."/mnt/General" = {
    device = "home-nas/General";
    fsType = "zfs";
  };
}
