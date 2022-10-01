#!/bin/bash
[[ $(id -u) != 0 ]] && echo -e "请在Root用户下运行安装该脚本" && exit 1

cmd="apt-get"
if [[ $(command -v apt-get) || $(command -v yum) ]] && [[ $(command -v systemctl) ]]; then
    if [[ $(command -v yum) ]]; then
        cmd="yum"
    fi
else
    echo "这个安装脚本不支持你的系统" && exit 1
fi


install(){
    if [ -d "/root/mymp" ]; then
        echo -e "检测到您已安裝MyMP，请勿重复安装，如您确认您未安装请使用rm -rf /root/mymp指令" && exit 1
    fi
    if screen -list | grep -q "mymp"; then
        echo -e "检测到您的MyMP已启动，请勿重复安装" && exit 1
    fi

    $cmd update -y
    $cmd install wget screen -y

    mkdir /root/mymp
    wget https://cdn.jsdelivr.net/gh/ycyw/mymp@main/common/cert.tar.gz -O /root/mymp/cert.tar.gz --no-check-certificate
    tar -zxvf /root/mymp/cert.tar.gz -C /root/mymp
    wget https://cdn.jsdelivr.net/gh/ycyw/mymp@main/script/run.sh -O /root/mymp/run.sh --no-check-certificate
    chmod 777 /root/mymp/run.sh

    wget https://cdn.jsdelivr.net/gh/ycyw/mymp@main/release/mymp_v1.3_linux.tar.gz -O /root/mymp_v1.3_linux.tar.gz --no-check-certificate
    tar -zxvf /root/mymp_v1.3_linux.tar.gz -C /root/mymp
    chmod 777 /root/mymp/mymp

    screen -dmS my_mp
    sleep 0.5s

    screen -r my_mp -p 0 -X stuff "cd /root/mymp"
    screen -r my_mp -p 0 -X stuff $'\n'
    screen -r my_mp -p 0 -X stuff "./run.sh"
    screen -r my_mp -p 0 -X stuff $'\n'

    sleep 5s
    echo "MyMP v1.3已经安装到/root/mymp"
    cat /root/mymp/login.txt
    echo ""
    echo "您可以使用指令screen -r my_mp查看程序日志"
}


uninstall(){
    read -p "您确定是否刪除MyMP[yes/no]：" flag
    if [ -z $flag ];then
         echo "您未正确输入" && exit 1
    else
        if [ "$flag" = "yes" -o "$flag" = "ye" -o "$flag" = "y" ];then
            screen -X -S my_mp quit
            rm -rf /root/mymp
            echo "MyMP 已成功从您的服务器上卸载"
        fi
    fi
}

update(){
    wget https://cdn.jsdelivr.net/gh/ycyw/mymp@main/release/mymp_v1.3_linux.tar.gz -O /root/mymp_v1.3_linux.tar.gz --no-check-certificate

    if screen -list | grep -q "my_mp"; then
        screen -X -S my_mp quit
    fi
    rm -rf /root/mymp/mymp

    tar -zxvf /root/mymp_v1.3_linux.tar.gz -C /root/mymp
    chmod 777 /root/mymp/mymp

    screen -dmS my_mp
    sleep 0.5s

    screen -r my_mp -p 0 -X stuff "cd /root/mymp"
    screen -r my_mp -p 0 -X stuff $'\n'
    screen -r my_mp -p 0 -X stuff "./run.sh"
    screen -r my_mp -p 0 -X stuff $'\n'

    sleep 5s
    echo "MyMP 已更新至v1.3版本"
    cat /root/mymp/login.txt
    echo ""
    echo "您可以使用指令screen -r my_mp查看程序日志"
}

start(){
    if screen -list | grep -q "my_mp"; then
        echo -e "检测到您的MyMP已启动，请勿重复启动" && exit 1
    fi
    
    screen -dmS my_mp
    sleep 0.5s
    screen -r my_mp -p 0 -X stuff "cd /root/mymp"
    screen -r my_mp -p 0 -X stuff $'\n'
    screen -r my_mp -p 0 -X stuff "./run.sh"
    screen -r my_mp -p 0 -X stuff $'\n'

    echo "MyMP已启动"
    echo "您可以使用指令screen -r my_mp查看程序日志"
}


restart(){
    if screen -list | grep -q "my_mp"; then
        screen -X -S my_mp quit
    fi
    
    screen -dmS my_mp
    sleep 0.5s
    screen -r my_mp -p 0 -X stuff "cd /root/mymp"
    screen -r my_mp -p 0 -X stuff $'\n'
    screen -r my_mp -p 0 -X stuff "./run.sh"
    screen -r my_mp -p 0 -X stuff $'\n'

    echo "MyMP 已重新启动"
    echo "您可以使用指令screen -r mymp查看程序日志"
}


stop(){
    screen -X -S my_mp quit
    echo "MyMP 已停止"
}


change_limit(){
    if grep -q "1000000" "/etc/profile"; then
        echo -n "您的系统连接数限制可能已修改，当前连接限制："
        ulimit -n
        exit
    fi

    cat >> /etc/sysctl.conf <<-EOF

fs.file-max = 1000000
fs.inotify.max_user_instances = 8192

net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_fin_timeout = 30
net.ipv4.tcp_tw_reuse = 1
net.ipv4.ip_local_port_range = 1024 65000
net.ipv4.tcp_max_syn_backlog = 16384
net.ipv4.tcp_max_tw_buckets = 6000
net.ipv4.route.gc_timeout = 100

net.ipv4.tcp_syn_retries = 1
net.ipv4.tcp_synack_retries = 1
net.core.somaxconn = 32768
net.core.netdev_max_backlog = 32768
net.ipv4.tcp_timestamps = 0
net.ipv4.tcp_max_orphans = 32768

# forward ipv4
# net.ipv4.ip_forward = 1
EOF

    cat >> /etc/security/limits.conf <<-EOF
*               soft    nofile          1000000
*               hard    nofile          1000000
EOF

    echo "ulimit -SHn 1000000" >> /etc/profile
    source /etc/profile

    echo "系统连接数限制已修改，手动reboot重启下系统即可生效"
}


check_limit(){
    echo -n "您的系统当前连接限制："
    ulimit -n
}


echo "======================================================="
echo "MyMP 一键脚本，脚本默认安装到/root/mymp，当前最新版本v1.3"
echo "  1、安  装"
echo "  2、卸  载"
echo "  3、更  新"
echo "  4、启  动"
echo "  5、重  启"
echo "  6、停  止"
echo "  7、一键解除Linux连接数限制(需手动重启系统生效)"
echo "  8、查看当前系统连接数限制"
echo "======================================================="
read -p "$(echo -e "请选择[1-8]：")" choose
case $choose in
    1)
        install
        ;;
    2)
        uninstall
        ;;
    3)
        update
        ;;
    4)
        start
        ;;
    5)
        restart
        ;;
    6)
        stop
        ;;
    7)
        change_limit
        ;;
    8)
        check_limit
        ;;
    *)
        echo "请输入正确的数字！"
        ;;
esac
