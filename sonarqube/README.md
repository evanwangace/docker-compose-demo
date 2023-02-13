# sonarqube部署文档

## 1.部署容器

### 1.1创建sonarqube文件夹，并进入文件夹

```
mkdir sonarqube & cd sonarqube
```

### 1.2 将docker-compose.yml拷贝到当前文件夹，并启动容器

```
docker-compose up -d
```

## 2.sonarqube插件配置（可选操作）

### 2.1安装多分支插件

```
https://www.jianshu.com/p/a35cae2a3894
```

### 2.2安装导出pdf报告插件

```
https://gitee.com/zzulj/sonar-pdf-plugin
```