# Define the vdev mirrors
  # Mirror 1 (1.8TiB)
  M1_0=/dev/disk/by-id/usb-Seagate_Expansion_NAA86M1Q-0:0 # big seagate 2TiB drive
  M1_1=/dev/disk/by-id/usb-USB_SanDisk_3.2Gen1_0501d505f206bbd4d0d93759899fb111e6c94513bd33b35c6b150e4d3d369a19ca57000000000000000000005ae7fe44009405108155810752ae26ab-0:0 # temporary usb drive (replace later with the toshiba 2TiB) (zpool set autotrim=on autoexpand=on home-nas && zpool offline home-nas /dev/disk/by-id/usb-USB_SanDisk_3.2Gen1_0501d505f206bbd4d0d93759899fb111e6c94513bd33b35c6b150e4d3d369a19ca57000000000000000000005ae7fe44009405108155810752ae26ab-0:0 && zpool replace home-nas /dev/disk/by-id/usb-USB_SanDisk_3.2Gen1_0501d505f206bbd4d0d93759899fb111e6c94513bd33b35c6b150e4d3d369a19ca57000000000000000000005ae7fe44009405108155810752ae26ab-0:0 /dev/disk/by-id/ata-TOSHIBA_MQ03UBB200_661DTC0BT)
  # Mirror 2 (931.5GiB)
  M2_0=/dev/disk/by-id/wwn-0x50004cf20de45c5a # my old computer drive (Sarbrent enclosure)
  M2_1=/dev/disk/by-id/wwn-0x50014ee65ce71933 # the WC drive
  # Mirror 3 (465.8GiB)
  M3_0=/dev/disk/by-id/wwn-0x5000c50052ea4cdc # 698.6GiB
  M3_1=/dev/disk/by-id/wwn-0x5002538e30218196 # 465.8GiB
  # Mirror 4 (223.6GiB)
  M4_0=/dev/disk/by-id/wwn-0x5000cca533e2816c # 232.9GiB
  M4_1=/dev/disk/by-id/usb-SanDisk_SDSSDHII240G_000000123DE9-0:0 # 223.6GiB

# Initialise the zfs pool
zpool create \
  -O mountpoint=none \
  -O xattr=sa \
  -O acltype=posixacl \
  -O compression=on \
  -o autotrim=on \
  -o autoexpand=on \
  -o ashift=12 \
  home-nas \
  mirror $M1_0 $M1_1 \
  mirror $M2_0 $M2_1 \
  mirror $M3_0 $M3_1 \
  mirror $M4_0 $M4_1

# Initialise the zfs datasets
zfs create -o refreservation=10G -o mountpoint=none home-nas/reserved
zfs create -o mountpoint=legacy home-nas/Garchive
zfs create -o mountpoint=legacy -o encryption=on -o keyformat=passphrase -o keylocation=prompt home-nas/Gackup
zfs create -o mountpoint=legacy home-nas/FamilyPhotos
zfs create -o mountpoint=legacy home-nas/General
