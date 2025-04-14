pssh -h host -l muhhae -x '-i ~/cloudlab' -i '
    sudo apt update &&
    sudo apt install -y glusterfs-server &&
    sudo systemctl enable --now glusterd.service &&
    sudo systemctl status glusterd.service
'
