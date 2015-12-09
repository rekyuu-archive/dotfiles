# Initial Installation

## Network

1. Use `ip link` to find the proper network adaptor.

	* Wired should work as usual
	* Wireless

		1. `wifi-menu -o <adaptor>`
		2. Connect as usual

2. `timedatectl set-ntp true`

## Storage Devices

1. Identify storage blocks with `lsblk`.
2. Partition your hard drive.

	* `parted /dev/sdx`
	* `mklabel gpt`
	* `mkpart ESP fat32 1MiB 513MiB`
	* `set 1 boot on`
	* `mkpart primary ext4 513MiB 100%`
	* `quit`

3. Write the filesystems.

	* `mkfs.fat -F32 -nEFI /dev/sdx1`
	* `mkfs.ext4 /dev/sdx2`

4. Prepare for installation.

	* `mount /dev/sdx2 /mnt`
	* `mkdir -p /mnt/boot`
	* `mount /dev/sdx1 /mnt/boot`

## Installation

1. `pacstrap -i /mnt base base-devel`
2. `genfstab -U /mnt > /mnt/etc/fstab`
3. `arch-chroot /mnt /bin/bash`

## Configuration

1. Generate locale

	* `locale-gen`
	* `echo "LANG=en_US.UTF-8" > /etc/locale.conf`

2. Setting the time

	* `tzselect`
	* `ln -s /usr/share/zoneinfo/<zone>/<subzone> /etc/localtime`
	* `hwclock --systohc --utc`

3. Installing the bootloader

	* `bootctl install`
	* Create `/boot/loader/entries/arch.conf`:

		```
		title 		Arch Linux
		linux 		/vmlinuz-linux
		initrd 		/initramfs-linux.img
		options 	root=/dev/sdx2
		```

	* Modify `/boot/loader/loader.conf`:

		```
		timeout 	3
		default 	arch
		```

4. Configure the network

	* `echo HOSTNAME > /etc/hostname`
	* Wired

		* `systemctl enable dhcpcd@<adaptor>.service`

	* Wireless

		* `pacman -S iw wpa_supplicant dialog`

## Unmount and Reboot

1. Set the root password with `passwd`
2. Quit the shell with `exit` or `CTRL + D`
3. `umount -R /mnt`
4. `reboot`
5. Done!

## Post-install Setup

## Users and Groups

1. `useradd -m -G wheel -s /bin/bash <username>`
2. `passwd <username>`
3. Uncomment the following line in `/etc/sudoers`:

	```
	# %wheel ALL=(ALL) ALL
	```

## Desktop Enviroment

* Install Pacaur

	1. Download [cower](https://aur.archlinux.org/packages/cower/).
	2. Download [pacaur](https://aur.archlinux.org/packages/pacaur/).
	3. `tar -xvf cower.tar.gz`
	4. `cd cower`
	5. `makepkg -sri`

		* You may need to verify a gpg key before running `makepkg`.

			1. `gpg --list-keys`
			2. `gpg --recv-keys <key>`
			3. `gpg --edit-key <key>`
			4. `trust`
			5. `5`
			6. `q`

	6. `cd ../pacaur`
	7. `makepkg -sri`

* Install i3-gaps

	1. `pacman -S xorg-server xorg-xinit xorg-xinput`
	2. `pacaur -S i3-gaps-git`
	3. Add the following to `~/.xinitrc`:

		```
		exec i3
		```

* Install `rxvt-unicode`

## Helpful Commands

* Remove all unused dependencies: `pacman -Rsn $(pacman -Qdtq)`
