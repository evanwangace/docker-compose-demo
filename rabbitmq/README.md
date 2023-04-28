# rabbitmq部署文档

## 1.部署容器

### 1.1 将当前`rabbitmq`目录拷贝上传至需要部署的服务器，并进入

```
cd rabbitmq
```

### 1.2 执行命令，赋予数据目录读写权限，否则将无法写入数据

```
chmod 777 ./data
chmod 777 ./log
```

### 1.3 启动容器

```
docker-compose up -d rabbitmq
```