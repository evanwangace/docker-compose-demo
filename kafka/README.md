# kafka部署文档

## 1.部署容器

### 1.1 将当前`kafka`目录拷贝上传至需要部署的服务器，并进入

```
cd kafka
```

### 1.2 执行命令，赋予数据目录读写权限，否则将无法写入数据

```
chmod 777 ./data
```

### 1.3 启动容器（如果不需要部署可视化界面，按需调整启动命令即可）

```
docker-compose up -d zookeeper kafka kafka-manager
```