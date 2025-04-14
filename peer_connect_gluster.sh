hostfile="host"
first_host=$(sed -n '1p' "$hostfile")

for ((i=2; i<=$(wc -l < "$hostfile"); i++)); do
    peer=$(sed -n "${i}p" "$hostfile")
    ssh -i ~/cloudlab muhhae@"$first_host" "sudo gluster peer probe $peer"
done


ssh -i ~/cloudlab muhhae@"$first_host" "sudo gluster peer status"
