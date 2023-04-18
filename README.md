<h1 align="center"><a href="https://github.com/wangming2674/docker-compose-demo" target="_blank">Docker Compose Demo</a></h1>
<p align="center">
  <a href="https://github.com/wangming2674/docker-compose-demo/blob/master/license"><img alt="LICENSE" src="https://img.shields.io/github/license/wangming2674/docker-compose-demo.svg"/></a>
  <a href="https://github.com/wangming2674"><img alt="author" src="https://img.shields.io/badge/author-Evan Wang-blue.svg"/></a>
  <a href="https://www.jetbrains.com/?from=docker-compose-demo"><img alt="author" src="https://img.shields.io/badge/IntelliJ%20IDEA-提供支持-green.svg"/></a>
</p>

<p align="center">
  <a href="https://github.com/wangming2674/docker-compose-demo/stargazers"><img alt="star" src="https://img.shields.io/github/stars/wangming2674/docker-compose-demo.svg?label=Stars&style=social"/></a>
  <a href="https://github.com/wangming2674/docker-compose-demo/network/members"><img alt="star" src="https://img.shields.io/github/forks/wangming2674/docker-compose-demo.svg?label=Fork&style=social"/></a>
  <a href="https://github.com/wangming2674/docker-compose-demo/watchers"><img alt="star" src="https://img.shields.io/github/watchers/wangming2674/docker-compose-demo.svg?label=Watch&style=social"/></a>
</p>

## 项目简介

您是否在工作中用`docker`搭建服务时，遇到过以下问题：

```text
1.每次都要重复查找搭建服务的docker命令，浪费时间。
2.找到的docker命令各式各样，毫无规范。
3.命令可以使用，但是需要设置的参数残缺不全。
4.对要搭建的服务需要设置的相关参数一知半解，无法配置。
5.不清楚使用的命令是否经过验证，无法保证安全性和可靠性。
```

`docker compose demo` 是一个旨在帮助开发者用`docker-compose` 快速、便捷、可靠地部署相关`docker`
服务的代码库，目前总共包含 `13` 个demo。

| 服务             | 功能简介          | 官方网站                         |
|:---------------|---------------|------------------------------|
| jenkins        | 持续集成工具        | https://www.jenkins.io       |
| gitlab         | 代码仓库管理系统      | https://gitlab.com           |
| redis          | 缓存数据库         | https://redis.io             |
| nginx          | 反向代理web服务器    | https://nginx.com            |
| sonarqube      | 源代码检测工具       | https://www.sonarsource.com  |
| mysql          | 关系数据库         | https://dev.mysql.com        |
| elastic search | 分布式的全文搜索引擎    | https://www.elastic.co       |
| logstash       | 服务器端数据处理管道    | https://www.elastic.co       |
| kibana         | 分布式数据分析与可视化平台 | https://www.elastic.co       |
| kafka          | 分布式消息队列       | https://kafka.apache.org     |
| minio          | 分布式文件存储       | https://min.io               |
| rabbitmq       | 分布式消息队列       | https://www.rabbitmq.com     |
| zookeeper      | 分布式应用程序协调服务   | https://zookeeper.apache.org |

> 如果大家还有其他想要搭建的`docker`服务，可以在[issue](https://github.com/wangming2674/docker-compose-demo/issues/new)中提出需求。

> 项目中`docker-compose`代码均来自于实践总结，但难免会出现错误，如果您发现有问题，请及时进行反馈，我会在收到反馈后第一时间进行修复。

> 如果您有已经编写好的`docker-compose`代码，欢迎提出PR，提前感谢您的贡献。🤝

## Docker和Docker-Compose安装

> 注意：以下脚本已经过`linux centos7.x`系统测试，其他系统无法保证完全适用。

```shell
#!/bin/bash
# 更新yum依赖
yum update -y && yum makecache -y

# 安装依赖包
yum install -y yum-uitls device-mapper-persistent-data lvm2

echo 'Install started...'

# 安装docker
curl https://download.docker.com/linux/centos/docker-ce.repo -o /etc/yum.repos.d/docker-ce.repo
yum install -y docker-ce

# 启动docker
systemctl enable docker
systemctl start docker

# 配置docker镜像加速
[ -f /etc/docker/daemon.json ] || touch /etc/docker/daemon.json
cat >>/etc/docker/daemon.json <<EOF
{
"registry-mirrors": ["https://gdhauhuq.mirror.aliyuncs.com"],
"log-driver":"json-file",
"log-opts":{"max-size" :"1000m","max-file":"5"}
}
EOF

# 重新加载docker配置
systemctl daemon-reload
systemctl restart docker

# 安装docker-compose
curl -L https://get.daocloud.io/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m) >/usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# 查看版本信息
docker -v
docker-compose -v

echo "Install completed!"
```

## Docker-Compose命令

```shell
# 在后台启动服务
docker-compose up -d 

# 查看启动的服务
docker-compose ps   

# 停止服务
docker-compose stop

# 查看帮助
docker-compose -h

# -f 指定使用的compose模板文件，默认为docker-compose.yml，可以多次指定。
docker-compose -f docker-compose.yml up -d 

# 启动所有容器，-d 将会在后台启动并运行所有的容器
docker-compose up -d

# 停用移除所有容器以及网络相关
docker-compose down

# 查看服务容器的输出
docker-compose logs

# 列出项目中目前的所有容器
docker-compose ps

# 构建（重新构建）项目中的服务容器。服务容器一旦构建后，将会带上一个标记名，例如对于 web 项目中的一个 db 容器，可能是 web_db，可以随时在项目目录下运行build命令。
docker-compose build

# 拉取服务依赖的镜像
docker-compose pull

# 重启项目中的服务
docker-compose restart

# 删除所有（停止状态的）服务容器。推荐先执行 docker-compose stop 命令来停止容器。
docker-compose rm 

# 在指定服务上执行一个命令。
docker-compose run ubuntu ping docker.com

# 设置指定服务运行的容器个数。通过 service=num 的参数来设置数量
docker-compose scale web=3 db=2

# 启动已经存在的服务容器。
docker-compose start

# 停止已经处于运行状态的容器，但不删除它。通过 docker-compose start 可以再次启动这些容器。
docker-compose stop
```

## 寻求支持

如果您遇到了技术上的问题难以解决，包括但不限于`docker`，请在`star`本项目后，加入以下qq群，我会对您进行支持。

> 🐧群号：463524210

## 其他

### 我的博客

定期会分享一些技术文章、心得感悟、和软件资源，欢迎关注。👉 [Evan's Blog ٩(๑❛ᴗ❛๑)۶](https://evanwang.blog.csdn.net)
