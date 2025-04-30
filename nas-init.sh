# Define the vdev mirrors
  # Mirror 1 (1.8TiB)
  M1_0=/dev/disk/by-id/ata-WDC_WD40EFPX-68C6CN0_WD-WX12DC4D1KK7
  M1_1=/dev/disk/by-id/wwn-0x50014ee216aa30a9

# Initialise the zfs pool
zpool create \
  -O mountpoint=none \
  -O xattr=sa \
  -O acltype=posixacl \
  -O compression=on \
  -o autotrim=on \
  -o autoexpand=on \
  -o ashift=12 \
  nas \
  mirror $M1_0 $M1_1

# Initialise the zfs datasets
zfs create -o refreservation=10G -o mountpoint=none nas/reserved
zfs create -o mountpoint=legacy nas/data
