# while IFS= read -r line; do
#     if ssh muhhae@$line -i ~/cloudlab "sudo mount -t glusterfs $line:/gv0 /mnt/gv0"; then
#         echo "Mounted successfully on $line"
#     else
#         echo "Failed to mount on $line"
#     fi
# done < host

pssh -h host -l muhhae -x '-i ~/cloudlab' -i 'sudo mount -t glusterfs $(hostname):/gv0 /mnt/gv0; sudo chown -R muhhae:$(id -gn muhhae) /mnt/gv0'
