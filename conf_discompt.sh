pssh -h host -x '-i ~/cloudlab' -i '''
    cd ~/distComp;
    wget -O conf.json https://github.com/1a1a11a/distComp/raw/refs/heads/main/conf.json;
    jq ".min_dram_gb_accept_new_task = 2 | .min_dram_gb_trigger_return = 96" conf.json > conf.json.tmp;
    mv conf.json.tmp conf.json;
    cat conf.json
'''
