# Define the vdevs
  V0=/dev/disk/by-id/usb-Seagate_Expansion_NAA86M1Q-0:0 # big seagate 2TiB drive
  V1=/dev/disk/by-id/ata-TOSHIBA_MQ03UBB200_661DTC0BT # big 2TiB Toshiba drive
  V2=/dev/disk/by-id/wwn-0x50004cf20de45c5a # my old computer drive (Sarbrent enclosure)
  V3=/dev/disk/by-id/wwn-0x50014ee65ce71933 # the WC drive
  V4=/dev/disk/by-id/wwn-0x5000cca533e2816c # 232.9GiB
  V5=/dev/disk/by-id/usb-SanDisk_SDSSDHII240G_000000123DE9-0:0 # 223.6GiB

# Initialise the zfs pool
zpool create \
  -O mountpoint=none \
  -O xattr=sa \
  -O acltype=posixacl \
  -O compression=on \
  -o autotrim=on \
  -o autoexpand=on \
  -o ashift=12 \
  kalcloud \
  V0 V1 V2 V3 V4 V5

# Initialise the zfs datasets
zfs create -o refreservation=10G -o mountpoint=none kalcloud/reserved
zfs create -o mountpoint=legacy -o encryption=on -o keyformat=passphrase -o keylocation=prompt kalcloud/Kloud
zfs create -o mountpoint=legacy kalcloud/jOffice
zfs create -o mountpoint=legacy kalcloud/jPersonal
zfs create -o mountpoint=legacy kalcloud/Media
zfs create -o mountpoint=legacy kalcloud/Misc
