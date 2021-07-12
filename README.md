# encrypt_ubuntu20-04
Instructions and shell scripts to encrypt partition and install Ubuntu 20-04 alongside Windows 10

## Reference

https://www.mikekasberg.com/blog/2020/04/08/dual-boot-ubuntu-and-windows-with-encryption.html

## Steps

In the terminal, run:

1. In windows, reduce an existing partition to free space for a new one for Ubuntu;

2. Insert pendrive with Ubuntu's installer;

3. Run Ubuntu in test mode;

4. In terminal run `lsblk` to see the partitions;
```
ubuntu@ubuntu:~$ lsblk
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
loop0         7:0    0     2G  1 loop /rofs
loop1         7:1    0  55.5M  1 loop /snap/core18/1988
loop2         7:2    0  64.8M  1 loop /snap/gtk-common-themes/1514
loop3         7:3    0  31.1M  1 loop /snap/snapd/11036
loop4         7:4    0   219M  1 loop /snap/gnome-3-34-1804/66
loop5         7:5    0    51M  1 loop /snap/snap-store/518
sda           8:0    1   3.6G  0 disk 
└─sda1        8:1    1   3.6G  0 part /cdrom
nvme0n1     259:0    0 238.5G  0 disk 
├─nvme0n1p1 259:1    0   150M  0 part 
├─nvme0n1p2 259:2    0   128M  0 part 
├─nvme0n1p3 259:3    0 120.7G  0 part 
├─nvme0n1p4 259:4    0   990M  0 part 
├─nvme0n1p5 259:5    0  17.6G  0 part 
└─nvme0n1p6 259:6    0   1.4G  0 part 
```

5. Customize codes from [Mike Kasberg](https://www.mikekasberg.com/blog/2020/04/08/dual-boot-ubuntu-and-windows-with-encryption.html) based on the specific partitions (sda or nvme?)
  - Replace code marked as `<replace>`
