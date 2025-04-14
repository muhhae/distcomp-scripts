hostfile="host"
first_host=$(sed -n '1p' "$hostfile")

scp -i ~/cloudlab ./task muhhae@"$first_host":~/task
ssh -i ~/cloudlab muhhae@"$first_host" "
    cd ~/distComp;
    python3 redisManager.py --task 'loadTask' --taskfile ~/task
"

ssh muhhae@"$first_host" -i ~/cloudlab "cd ~/distComp && python3 redisManager.py --task checkTask"
