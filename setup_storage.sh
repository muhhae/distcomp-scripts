pssh -h host -l muhhae -x '-i ~/cloudlab' -i '
    sudo sgdisk -e /dev/sda &&
    sudo partprobe /dev/sda &&
    sudo sgdisk -n sda4:0:0 -t 4:8300 -c 4:"xfs-part" /dev/sda &&
    sudo partprobe /dev/sda &&
    sudo apt update && sudo apt install -y xfsprogs &&
    sudo mkfs.xfs -f "/dev/sda4" &&
    sudo mkdir -p /data/brick1/gv0 &&
    echo "/dev/sda4 /data/brick1 xfs defaults 1 2" | sudo tee -a /etc/fstab &&
    sudo mount -a && sudo mount
'
