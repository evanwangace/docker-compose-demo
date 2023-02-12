# gitlab-runner部署文档

## 1.部署容器

### 1.1增加root权限
```
# 在宿主机启动docker后，执行以下命令，如果重启过docker，需要重新执行
sudo chown root:root /var/run/docker.sock
```

### 1.2创建gitlab-runner文件夹，并进入文件夹
```
mkdir gitlab-runner & cd gitlab-runner
```

### 1.3 将docker-compose.yml拷贝到当前文件夹，并启动容器
```
docker-compose up -d
```

### 1.4添加容器权限
```
# 添加容器权限，保证容器可以使用宿主机的docker
docker exec -it gitlab-runner usermod -aG root gitlab-runner
```

## 2.配置runner
```
# 注册Runner信息到gitlab
docker exec -it gitlab-runner gitlab-runner register

# 输入 GitLab 地址
Please enter the gitlab-ci coordinator URL (e.g. https://gitlab.com/):
http://192.168.100.68:8929/

# 输入 GitLab Token
Please enter the gitlab-ci token for this runner:
1Lxq_f1NRfCfeNbE5WRh

# 输入 Runner 的说明，可以为空
Please enter the gitlab-ci description for this runner:
deploy-test

# 设置 Tag，可以用于指定在构建规定的 tag 时触发 ci
Please enter the gitlab-ci tags for this runner (comma separated):
deploy

# 这里选择 true ，可以用于代码上传后直接执行（根据版本，也许会没有此选项）
Whether to run untagged builds [true/false]:
true

# 这里选择 false，可以直接回车，默认为 false（根据版本，也许会没有此选项）
Whether to lock Runner to current project [true/false]:
false

# 选择 runner 执行器，这里我们选择的是 shell
Please enter the executor: virtualbox, docker+machine, parallels, shell, ssh, docker-ssh+machine, kubernetes, docker, docker-ssh:
shell
```

## 3.参考文章
```
gitlab教程
https://www.bilibili.com/video/BV18y4y1S7VC?p=6

docker-compose部署gitlab和gitlab-runner
https://blog.csdn.net/fengtao0821/article/details/110526941
https://blog.csdn.net/qq_36525300/article/details/100620858
https://blog.csdn.net/bpqdwo/article/details/93715719

gitlab-runner的3种runner创建和使用
https://blog.csdn.net/weixin_43878297/article/details/119865646

gitlab-runner使用maven缓存
https://www.itranslater.com/qa/details/2583830939189117952
http://t.zoukankan.com/sanduzxcvbnm-p-14681797.html
```