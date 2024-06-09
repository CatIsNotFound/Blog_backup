# 判断 ~/apt 目录是否存在
if [ ! -d ~/apt ]; then
    mkdir ~/apt
fi

# 判断 ~/apt/history.log 文件是否存在
if [ ! -f ~/apt/history.log ]; then
    cp /var/log/apt/history.log ~/apt/history.log
fi