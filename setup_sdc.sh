pssh -h host -l muhhae -x '-i ~/cloudlab' -i '
    sudo sgdisk -e /dev/sdc &&
    sudo partprobe /dev/sdc &&
    sleep 2 &&
    sudo sgdisk -n 1:0:0 -t 1:8300 -c 1:"xfs-sdc" /dev/sdc &&
    sudo partprobe /dev/sdc &&
    sleep 2;
    sudo mkfs.xfs -f "/dev/sdc1";
    sudo mkdir -p /data/brick3/gv0;
    echo "/dev/sdc1 /data/brick3 xfs defaults 1 2" | sudo tee -a /etc/fstab;
    sudo mount -a; sudo mount
'
