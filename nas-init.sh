# Define the vdev mirrors
  # Mirror 1 (1.8TiB)
  M1_0=/dev/disk/by-id/usb-USB_3.0_Device_0_000000004E95-0:0
  M1_1=/dev/disk/by-id/usb-USB_3.0_Device_1_000000004E95-0:1

# Initialise the zfs pool
zpool create \
  -O mountpoint=none \
  -O xattr=sa \
  -O acltype=posixacl \
  -O compression=on \
  -o autotrim=on \
  -o autoexpand=on \
  -o ashift=12 \
  kalnas \
  mirror $M1_0 $M1_1

# Initialise the zfs datasets
zfs create -o refreservation=10G -o mountpoint=none kalnas/reserved
zfs create -o mountpoint=legacy -o encryption=on -o keyformat=passphrase -o keylocation=prompt kalnas/Garchive
zfs create -o mountpoint=legacy -o encryption=on -o keyformat=passphrase -o keylocation=prompt kalnas/Gackup
zfs create -o mountpoint=legacy kalnas/FamilyPhotos
zfs create -o mountpoint=legacy kalnas/DeviceBackup
zfs create -o mountpoint=legacy kalnas/Misc
