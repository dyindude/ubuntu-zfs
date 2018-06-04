# ubuntu-zfs
Ansible playbook that implements https://github.com/zfsonlinux/zfs/wiki/Ubuntu-18.04-Root-on-ZFS

## Usage
- Edit `ansible/vars.yml` with your desired settings.
- For testing, I've been using `/dev/sdX` disk device references instead of `by-id` as recommended in the guide. (to be fixed)
- Run `packer build -on-error=ask ubuntu-zfs.json` to test the playbook in a Virtualbox machine (currently testing via EFI)
- Playbook hasn't yet been tested on real hardware, will report back with more commits

## some handy variables
- `zfsprep_zap_disks: true` - forcibly nuke any partitions on existing disks
- `zfsprep_root_pool` - root pool name
- `zfsprep_data_pool` - data pool name (separate from root pool)
- `zfsprep_efi: true` - Use EFI layout, install grub-efi instead of grub-pc. Set to `false` to install grub-pc instead
- `zfsprep_hostname` - short and FQDN hostnames to configure in the target OS
- `zfsprep_root_disks` - target disks for root pool
- `zfsprep_data_disks` - target disks for data pool
- `zfsprep_root_pool_type` - pool type for root pool
- `zfsprep_data_pool_type` - pool type for data pool

a few more in `ansible/roles/01-system-prep/defaults/main.yml`
