## 初始信息查询
用户：root
<br />
密码： 输入如下命令。PS： -it 后参数默认为 gitlab-web-1 ，具体请输入docker ps 查询 NAMES
```shell
docker exec -it gitlab-web-1 grep 'Password:' /etc/gitlab/initial_root_password
```

