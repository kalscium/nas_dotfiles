{
  # Import the zfs pools at boot
  boot.zfs.extraPools = [ "kalnas" "kalcloud" ];

  # The datasets to decrypt on boot (none as blocking on boot is un-desired)
  boot.zfs.requestEncryptionCredentials = [];

  # ZFS Configurations
  services.zfs = {
    autoScrub.enable = true;
    trim.enable = true;
  };

  # NAS Pool Mountpoints
  fileSystems."/nas/FamilyPhotos" = {
    device = "kalnas/FamilyPhotos";
    fsType = "zfs";
  };
  fileSystems."/nas/Misc" = {
    device = "kalnas/Misc";
    fsType = "zfs";
  };
  fileSystems."/nas/DeviceBackup" = {
    device = "kalnas/DeviceBackup";
    fsType = "zfs";
  };

  # Cloud Pool Mountpoints
  fileSystems."/cloud/jOffice" = {
    device = "kalcloud/jOffice";
    fsType = "zfs";
  };
  fileSystems."/cloud/jPersonal" = {
    device = "kalcloud/jPersonal";
    fsType = "zfs";
  };
  fileSystems."/cloud/Media" = {
    device = "kalcloud/Media";
    fsType = "zfs";
  };
  fileSystems."/cloud/Misc" = {
    device = "kalcloud/Misc";
    fsType = "zfs";
  };
}
