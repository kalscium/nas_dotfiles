{
  # Import the zfs pools at boot
  boot.zfs.extraPools = [ "nas" ];

  # The datasets to decrypt on boot (none as blocking on boot is un-desired)
  boot.zfs.requestEncryptionCredentials = [];

  # ZFS Configurations
  services.zfs = {
    autoScrub.enable = true;
    trim.enable = true;
  };

  # NAS Pool Mountpoints
  fileSystems."/nas" = {
    device = "nas/data";
    fsType = "zfs";
  };
}
