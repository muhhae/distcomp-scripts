pssh -h host -l muhhae -x '-i ~/cloudlab' -i '
    sudo sgdisk -e /dev/sdb &&
    sudo partprobe /dev/sdb &&
    sleep 2 &&
    sudo sgdisk -n 1:0:0 -t 1:8300 -c 1:"xfs-sdb" /dev/sdb &&
    sudo partprobe /dev/sdb &&
    sleep 2;
    sudo mkfs.xfs -f "/dev/sdb1";
    sudo mkdir -p /data/brick2/gv0;
    echo "/dev/sdb1 /data/brick2 xfs defaults 1 2" | sudo tee -a /etc/fstab;
    sudo mount -a && sudo mount
'
