# Packer Repo

This is a Packer repo.  The current build ("custom.pkr.hcl") builds a plain Ubuntu "Jammy" server for VMWare Workstation.  It is tested and works with Pop! 22.04 with a 5.19 kernel and VMWare Workstation 16.2.4.

The interesting piece for other folks will be the way that I implemented the auto-install instructions.  Typically the way this is done is by placing a file (_user\_data_ in this case) into the http folder.  Packer makes that folder available through a local Apache installation.  However, I could not get the VM to "see" the website and draw down the file.  I tried several iterations of network configuration to no avail.

This example works by taking the auto-install files and placing them in an ISO image, then attaching the image to the VM.  To do this, I installed the cloud utilities from Ubuntu.  I used __cloud-localds__ to put the two data files into a small ISO.

    sudo apt install cloud-image-utils
    cloud-localds ./seed.iso user-data meta-data

Later I discovered that this can be done in the packer specification:

      cd_files = [
        "./http/meta-data",
        "./http/user-data"]
    cd_label = "cidata"

Notice that the boot commands reference the ISO.