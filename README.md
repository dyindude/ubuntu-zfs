# ubuntu-zfs
Ansible playbook that implements https://github.com/zfsonlinux/zfs/wiki/Ubuntu-18.04-Root-on-ZFS

## Usage
- Edit `ansible/vars.yml` with your desired settings.
- Run `packer build -on-error=ask ubuntu-zfs-{{ mbr || efi }}.json` to test the playbook in a Virtualbox machine.
- The last provisioner is simply a shell provisioner that runs `false`, so you can examine the resulting system once the playbook has completed.
- Playbook hasn't yet been tested on real hardware, will report back with more commits

## some handy variables
- `zfsprep_zap_disks: true` - forcibly nuke any partitions on existing disks
- `zfsprep_legacy_device_nodes` - set to `true` to use `/dev/sdX` device names instead of `by-id`
- `zfsprep_root_pool` - root pool name
- `zfsprep_data_pool` - data pool name (separate from root pool)
- `zfsprep_efi: true` - Use EFI layout, install grub-efi instead of grub-pc. Set to `false` to install grub-pc instead
- `zfsprep_luks` - LUKS support, currently only creates the extra partitions, does NOT set up LUKS
- `zfsprep_hostname` - short and FQDN hostnames to configure in the target OS
- `zfsprep_root_disks` - target disks for root pool
- `zfsprep_data_disks` - target disks for data pool
- `zfsprep_root_pool_type` - pool type for root pool
- `zfsprep_data_pool_type` - pool type for data pool
- `zfsprep_extra_locales` - list of extra locales to install alongside `en_US.UTF-8`
- `zfsprep_lang` - LANG to set in `/etc/default/locale`
- `zfsprep_timezone` - timezone to set in resulting OS (defaults to `UTC`)

a few more in `ansible/roles/01-system-prep/defaults/main.yml`
