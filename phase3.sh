# Replace /dev/sda with the disk name found with lsblk
# Replace 5: for the number of the partition
# Replace 6: for the number of the partition

sudo su
sgdisk --new=5:0:+768M /dev/sda
sgdisk --new=6:0:0 /dev/sda
sgdisk --change-name=5:/boot --change-name=6:rootfs /dev/sda
sgdisk --typecode=5:8300 --typecode=6:8300 /dev/sda
mkfs.ext4 -L boot /dev/sda5

