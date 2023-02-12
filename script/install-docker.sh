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
