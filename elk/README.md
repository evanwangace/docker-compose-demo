# elk部署文档

## 1.部署容器

### 1.1 将当前`elk`目录拷贝上传至需要部署的服务器，并进入

```
cd elk
```

### 1.2 执行命令，赋予数据目录读写权限，否则将无法写入数据

```
chmod 777 ./elasticsearch/data
chmod 777 ./elasticsearch/logs
chmod 777 ./elasticsearch/plugins
```

### 1.3 启动容器（如果不需要部署整个elk，按需调整启动命令即可）

```
docker-compose up -d elasticsearch kibana logstash
```