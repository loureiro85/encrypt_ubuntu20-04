# Replace /dev/sda with the disk name found with lsblk
# Replace 5: for the number of the partition
# Replace 6: for the number of the partition

# # Original code
# sudo su
# sgdisk --new=5:0:+768M /dev/sda
# sgdisk --new=6:0:0 /dev/sda
# sgdisk --change-name=5:/boot --change-name=6:rootfs /dev/sda
# sgdisk --typecode=5:8300 --typecode=6:8300 /dev/sda
# mkfs.ext4 -L boot /dev/sda5

# Customized code
sudo su
sgdisk --new=7:0:+768M /dev/nvme0n1
sgdisk --new=8:0:0 /dev/nvme0n1
sgdisk --change-name=7:/boot --change-name=8:rootfs /dev/nvme0n1
sgdisk --typecode=7:8300 --typecode=8:8300 /dev/nvme0n1
mkfs.ext4 -L boot /dev/nvme0n1p7


# Setup LUKS on our Linux data partition
cryptsetup luksFormat --type=luks1 /dev/nvme0n1p8
cryptsetup open /dev/nvme0n1p8 nvme0n1p8_crypt   
ls /dev/mapper/


# Setup LVM inside our encrypted partition for a data volume and swap space
pvcreate /dev/mapper/nvme0n1p8_crypt
vgcreate ubuntu-vg /dev/mapper/nvme0n1p8_crypt
lvcreate -L 16G -n swap_1 ubuntu-vg
lvcreate -l 100%FREE -n root ubuntu-vg
