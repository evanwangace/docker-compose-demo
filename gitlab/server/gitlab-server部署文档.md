# gitlab-server部署文档

## 1.部署容器

### 1.1 创建gitlab-server文件夹，并进入文件夹
```
mkdir gitlab-server & cd gitlab-server
```

### 1.2 将docker-compose.yml拷贝到当前文件夹，并启动容器
```
docker-compose up -d
```

### 1.3 获取gitlab root账号初始密码
```
docker exec -it 容器id grep 'Password:' /etc/gitlab/initial_root_password
```

## 2.修改内存占用

```
https://blog.csdn.net/sxy_student/article/details/121597314
https://blog.csdn.net/wang_jing_jing/article/details/122859181
https://blog.csdn.net/teddy_husky/article/details/113882844
```

## 3.测试邮件服务

```
docker exec -it 容器id /bin/bash
gitlab-rails console -e production
Notify.test_email('test@qq.com', 'Test Email', 'This is test message').deliver_now
```