source "vmware-iso" "jammy-development" {
  iso_urls         =[
    "file:/media/brent/Ventoy/ubuntu-22.04.1-live-server-amd64.iso",
    "https://releases.ubuntu.com/22.04.1/ubuntu-22.04.1-live-server-amd64.iso"]
  iso_checksum     = "sha256:10f19c5b2b8d6db711582e0e27f5116296c34fe4b313ba45f9b201a5007056cb"
  iso_target_path  = "/media/brent/Ventoy"
  version          = "16"
  memory           = 4096
  cd_files = [
    "./http/meta-data",
    "./http/user-data"]
  cd_label = "cidata"
  cpus = 1
  cores = 2
  disk_type_id = 0
  network = "nat"
  network_adapter_type = "vmxnet3"
  vm_name          = "Ubuntu2204-dev"
  ssh_username     = "vmadmin"
  ssh_password     = "MyP@ssw0rd-22!"
  shutdown_command = "sudo shutdown -P now"
  boot_wait = "5s"
  boot_command = [
    "c<wait>",
    "linux /casper/vmlinuz ds=nocloud-net s=/cidata",
    "<enter>",
    "initrd /casper/initrd",
    "<enter>",
    "boot<enter><wait60>",
    "yes<wait120>"
  ]
}

build {
  sources = ["sources.vmware-iso.jammy-development"]
}
