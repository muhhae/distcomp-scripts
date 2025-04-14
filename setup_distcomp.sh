hostfile="host"
sed -n '2,$p' $hostfile > worker
pssh -h $hostfile -l muhhae -x '-i ~/cloudlab' -i '
    sudo apt install -y screen;
    sudo apt install -y python3-pip;
    pip install redis psutil;
    [ ! -d distComp ] && git clone https://github.com/1a1a11a/distComp --depth 1
'
first_host=$(sed -n '1p' "$hostfile")
ssh -i ~/cloudlab muhhae@"$first_host" "
    pip install parallel-ssh;
    cd ~/distComp;
    bash ./redis.sh;
    python3 redisManager.py --task 'initRedis&loadTask' --taskfile task
"
pssh -h worker -x '-i ~/cloudlab' -i '''
    cd ~/distComp;
    screen -S worker -L -Logfile workerScreen/$(hostname) -dm python3 redisWorker.py
'''

