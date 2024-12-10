{
  # Import the zfs pool at boot
  boot.zfs.extraPools = [ "home-nas" ];

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
  fileSystems."/mnt/Gackup" = {
    device = "home-nas/Gackup";
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
