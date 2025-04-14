host=()

while IFS= read -r line; do
    host+=($line:/data/brick1/gv0 )
done < host

ssh muhhae@$(sed -n '1p' host) -i ~/cloudlab "
    sudo gluster volume create gv0 ${host[@]} &&
    sudo gluster volume start gv0 &&
    sudo gluster volume info
"
