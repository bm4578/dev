## Centos7 系统初始化

PS : 目前仅支持centos
1. 远程ssh连接云服务器
    ```shell
    ssh 用户名@ip
    ```
2. 安装git
   ```shell
   yum install -y git
   ```
4. 克隆仓库,国内请[参考](https://gitee.com/bmt4578/docker.git) 。
    ```shell
    git clone https://github.com/bm4578/docker.git
    cd docker
    ```
5. 运行脚本
    ```shell
    bash docker.sh 
    ```
   ![](https://raw.githubusercontent.com/bm4578/images/master/202301111918656.png)

# docker-compose 使用说明
1. 拉取仓库
    - 国外请参考：
        ```shell
        git clone https://github.com/bm4578/docker-compose.git
        ```
    - 国内请参考：
       ```shell
        git clone https://gitee.com/bmt4578/docker-comopose.git
       ```
2. 进入要安装的目录，这里以mysql为例
    ```shell
    cd docker-compose/mysql/mysql8.0.27
    ```
3. 配置自己需要的信息
    ```shell
    vim docker-compose.yml
    ```
   例如：
   ![](https://raw.githubusercontent.com/bm4578/images/master/202302271551469.png)
4. 执行安装命令
    ```shell
    docker-compose up -d
    ```
5. 若有问题及时联系:邮箱:bmt4578@gmail.com ，后续会不定期更新其它服务，若对您有帮助可以点一个免费的Star。   
