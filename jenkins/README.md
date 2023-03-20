## 初始信息查询
用户：root
<br />
密码： 输入如下命令。PS： -it 后参数默认为 gitlab-web-1 ，具体请输入docker ps 查询 NAMES
```shell
docker-compose exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

# 配置加速

配置Jenkins插件源：登录Jenkins后台，在系统管理中选择“插件管理”，在“高级”选项卡中，将默认的插件源更改为Jenkins中文社区的插件源。

```shell
https://mirrors.tuna.tsinghua.edu.cn/jenkins/updates/current/update-center.json
```
配置Jenkins更新源：在系统管理中选择“插件管理”，在“高级”选项卡中，将默认的更新源更改为Jenkins中文社区的更新源。

```shell
https://mirrors.tuna.tsinghua.edu.cn/jenkins/updates/stable/latest/update-center.json
```
配置Jenkins Docker加速器：在系统管理中选择“系统设置”，在“全局属性”下添加一个名为DOCKER_REGISTRY_MIRROR的环境变量，将值设置为国内镜像加速器的地址。
```shell
DOCKER_REGISTRY_MIRROR=https://docker.mirrors.ustc.edu.cn
```


