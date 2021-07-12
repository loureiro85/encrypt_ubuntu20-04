# After the installer is finished and hit Continue Testing

# Set up etc/crypttab. This is what will allow you to unlock your encrypted drive by typing in your passphrase when booting.

mount /dev/mapper/ubuntu--vg-root /target
mount /dev/nvme0n1p7 /target/boot
for n in proc sys dev etc/resolv.conf; do mount --rbind /$n /target/$n; done 
chroot /target
      
mount -a




# Find the UUID of the partition you set up with LUKS
sudo blkid /dev/nvme0n1p8

sudo nano /etc/crypttab

# <target name> <source device> <key file> <options>
# options used:
#     luks    - specifies that this is a LUKS encrypted device
#     tries=0 - allows to re-enter password unlimited number of times
#     discard - allows SSD TRIM command, WARNING: potential security risk (more: "man crypttab")
#     loud    - display all warnings
nvme0n1p8_crypt UUID=abcdefgh-1234-5678-9012-abcdefghijklm none luks,discard
