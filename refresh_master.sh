hostfile="host"
first_host=$(sed -n '1p' "$hostfile")

scp -i ~/cloudlab task muhhae@"$first_host":/home/muhhae/task
ssh -i ~/cloudlab muhhae@"$first_host" "
    cd ~/distComp && python3 redisManager.py --task 'initRedis&loadTask' --taskfile /home/muhhae/task
"
