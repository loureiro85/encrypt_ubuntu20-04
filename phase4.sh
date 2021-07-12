# Set up etc/crypttab. 
# This is what will allow you to unlock your encrypted drive by typing in your passphrase when booting.

mount /dev/mapper/ubuntu--vg-root /target
mount /dev/nvme0n1p7 /target/boot
for n in proc sys dev etc/resolv.conf; do mount --rbind /$n /target/$n; done 
chroot /target
      
mount -a
