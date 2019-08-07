# dotfiles

#### NixOS install steps
- Partition disk (GPT)
```bash
parted /dev/sda -- mklabel gpt

parted /dev/sda -- mkpart ESP fat32 1MiB 512MiB
parted /dev/sda -- set 3 boot on

parted /dev/sda -- mkpart primary 512MiB -100MiB

parted /dev/sda -- mkpart primary linux-swap -100MiB 100%
```

- Encrypt root partition
```bash
cryptsetup luksFormat /dev/sda2
cryptsetup luksOpen /dev/sda2 cryptroot
```

- Format partitions
```bash
mkfs.fat -F 32 -n boot /dev/sda1
mkfs.ext4 -L nixos /dev/mapper/cryptroot
mkswap -L swap /dev/sda3
```

- Mount partitions
```bash
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot
swapon /dev/sda3
```

- Generate config & install
```bash
nixos-generate-config --root /mnt
nixos-install
```

#### NixOS configuration
Run the installation script:
```bash
./install.sh
```
