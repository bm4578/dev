#!/bin/bash


# 提示信息
message(){
  # shellcheck disable=SC2162
  read -p "
  1.安装国内镜像(阿里源)，以及基本软件(wget、vim、git)
  2.安装docker
  3.安装docker-compose
  4.安装minio(必须具备docker、docker-compose环境)
  5.退出脚本
  输入数字(1-5),选择你要进行的操作:" num
  return "$num"
}

# 配置基本环境
environment() {
      curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
      yum makecache
      yum install -y epel-release
      yum update -y
      yum install -y wget vim
      echo "docker安装完成！！"
      message

}
# 安装docker
install_docker() {
      curl -sSL https://get.daocloud.io/docker | sh
      systemctl start docker
      systemctl enable docker
      systemctl restart docker
      echo "docker安装完成！！！"
      message
}

# 安装docker-compose
install_docker-compose() {
      curl -L https://get.daocloud.io/docker/compose/releases/download/v2.4.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose      chmod +x /usr/local/bin/docker-compose
      ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
      echo "docker-compose安装完成！！！"
      message
}

# 安装minio
install_minio() {
      cd /home
      mkdir -p "minio/minio_data"
      cd minio
      chown 1001 minio_data
      wget https://link.storjshare.io/s/jx6nbon5k7o447td2cmicercyvma/data/dev/docker/minio/docker-compose.yml?download=1 -O docker-compose.yml
      docker-compose up -d
      firewall-cmd --zone=public --add-port=9000-9001/tcp --permanent
      echo "minio安装完成"
      cat docker-compose.yml
      echo "进入：ip:9001
      输入上述账号和密码登录"
      exit 1
}


main(){
      message
      case $? in
        1)
        environment
        ;;
        2)
        install_docker
        ;;
        3)
        install_docker-compose
        ;;
        4)
        install_minio
        ;;
        5)
        exit 1
        ;;
        *)
        echo -e "请输入正确的数字 (1-5)"
        ;;
    esac

}

# 调用函数
main