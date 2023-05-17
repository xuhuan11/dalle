# dalle
1.vue-pic存放前端vue代码,运行npm run build生成前端静态文件夹dist，
将dist文件夹拷贝到/dalle/docker-compose/nginx/下重命名为html

2.修改/docker-compose/nginx/nginx.conf文件，填写你的服务器IP

3.使用DockerCompose启动进入文件夹 /docker-compose 修改 docker-compose.yml 文件

4.进入文件夹 /docker-compose 运行以下命令

 # 前台运行
 docker-compose up
 # 或后台运行
 docker-compose up -d
