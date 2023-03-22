#!/bin/bash


# 提示信息
message(){
  # shellcheck disable=SC2162
  read -p "
  注意：需要以root权限运行，不然容易出权限bug
  0.安装国内yum源(中科大源)，以及基本软件(wget、vim、htop)
  1.卸载docker
  2.安装docker(中科大源)
  3.安装docker-compose
  4.退出脚本
  输入数字(1-5),选择你要进行的操作:" num
  return "$num"
}

# 配置基本环境 ,参考文档：https://mirrors.ustc.edu.cn/help/centos.html
environment() {
      sudo sed -e 's|^mirrorlist=|#mirrorlist=|g' \
         -e 's|^#baseurl=http://mirror.centos.org/centos|baseurl=https://mirrors.ustc.edu.cn/centos|g' \
         -i.bak \
         /etc/yum.repos.d/CentOS-Base.repo
      yum makecache
      yum install -y epel-release
      yum update -y
      yum install -y wget vim htop
      echo "系统初始化完成 ！！！"
      exit 1
}
# 安装docker
install_docker() {
      sudo yum install -y yum-utils device-mapper-persistent-data lvm2
      sudo yum-config-manager \
      --add-repo \
      https://mirrors.ustc.edu.cn/docker-ce/linux/centos/docker-ce.repo
      sudo yum install -y docker-ce
      sudo systemctl start docker
      sudo systemctl enable docker
      echo "docker安装完成！！！"
      echo "安装国内加速器中 ..."
      sudo mkdir -p /etc/docker
      sudo tee /etc/docker/daemon.json <<-'EOF'
      {"registry-mirrors": ["https://docker.mirrors.ustc.edu.cn"]}
EOF
      sudo systemctl daemon-reload
      sudo systemctl restart docker
      systemctl restart docker
      echo "docker加速器安装完成 ！！！"
      exit 1
}
# 卸载docker
uninstall_docker(){
      systemctl stop docker
      rm -rf /etc/docker
      rm -rf /run/docker
      rm -rf /var/lib/dockershim
      rm -rf /var/lib/docker
      yum remove containerd.io.x86_64 docker-ce.x86_64 docker-ce-cli.x86_64 docker-ce-rootless-extras.x86_64 docker-scan-plugin.x86_64 -y
      exit 1
}

# 安装docker-compose
install_docker-compose() {
      curl -L https://get.daocloud.io/docker/compose/releases/download/v2.4.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
      sudo chmod +x /usr/local/bin/docker-compose
      sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
      echo "docker-compose安装完成 ！！！"
      exit 1
}

main(){
      message
      case $? in
        0)
        environment
        ;;
        1)
        uninstall_docker
        ;;
        2)
        install_docker
        ;;
        3)
        install_docker-compose
        ;;
        4)
        exit 1
        ;;
        *)
        echo -e "请输入正确的数字 (0-5)"
        ;;
    esac

}

# 调用函数
main