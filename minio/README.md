## 官方文档
[点此跳往](https://min.io/docs/minio/linux/developers/java/API.html)

## 配置说明
1. 安装minio。前提需要装好docker、docker-compose环境，请[参考](https://github.com/bm4578/minio.git) 。
    + 创建文件夹
       ```shell
       mkdir -p "minio/minio_data"
       cd minio
       ```
    + 赋予docker-compose可执行权限
       ```shell
       chown 1001 minio_data
       ```
    + 下载配置文件
       ```shell
       wget https://link.storjshare.io/s/jx6nbon5k7o447td2cmicercyvma/data/dev/docker/minio/docker-compose.yml?download=1 -O docker-compose.yml
       ```
    + 开始安装
       ```shell
       docker-compose up -d
       ```
    + 放通端口
       ```shell
       firewall-cmd --zone=public --add-port=9000-9001/tcp --permanent
       ```
