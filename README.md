<h1 align="center">
  <img src="https://cdn.jsdelivr.net/gh/ycyw/mymp@main/images/logo.png" width="230"/>
</h1>

<h4 align="center">矿池转发代理工具，独家自研零损耗抽水算法，超低内存使用率(每台矿机仅需0.3MB)</h4>

![Screenshot](https://cdn.jsdelivr.net/gh/ycyw/mymp@main/images/home1.jpg)
## :zap: 功能
* 支持币种：ETC、RVN、ERG、CFX、ETHW、ETHF、NEOX、FIRO
* 自研不掉线零无效零损耗抽水算法
* 动态修改抽水率
* 全币种支持跨池抽水
* 抽水率最高可设置为90%
* 在线自定义修改网页后台端口、密码
* 自定义矿池地址
* 内置常用矿池地址
* 矿池显示的本地算力修改
* 支持TCP、SSL连接协议
* 内置SSL证书
* 算力曲线统计图表
* 全功能web网页操作
* 进程守护运行防止程序崩溃导致矿机掉线
* 更多功能开发中...
## :memo: 使用教程
<!-- * youtube视频教程：[https://youtu.be/1XXfNRHCo0k](https://youtu.be/1XXfNRHCo0k) -->
* 视频教程：[https://t.me/myminerproxy/1046](https://t.me/myminerproxy/1046)
## :tada: 安装
* Linux系统一键管理脚本(自带崩溃重启)  
1. 服务器中执行以下命令，根据提示输入数字后回车执行
```shell
bash <(curl -s -L https://cdn.jsdelivr.net/gh/ycyw/mymp@main/script/manage.sh)
```
2. 安装完成后底部会显示后台地址、随机端口和密码，复制登录即可。如果忘记地址或密码，在服务器中执行以下命令查看
```shell
cat /root/mymp/login.txt
```
3. 再次连接服务器可以使用以下命令查看日志输出
```shell
screen -r my_mp
```
* Windows系统(使用有公网IP的服务器)  
1. 在 [GitHub Release](https://github.com/ycyw/mymp/releases) 页面下载windows.zip后缀的最新版本程序  
2. 下载完成后，解压压缩包，双击打开``启动.bat``即可  
#### 注：若网页后台打开不了，请检查云服务器的防火墙/安全组是否开放对应端口
## :speech_balloon: 联系方式
* [Telegram 交流群组](https://t.me/myminerproxy)

## :sparkles: 开发抽水
* 恒定0.3%

## :bricks: 最新版本：v1.3（2022.10.01）
* 修复同名矿机并发上线可能导致异常数据的问题
* 优化抽水逻辑100%无损，抽水不掉线不会产生无效，全币种支持跨池抽水，抽水率最高可设置为90%
* 新增矿机实际抽水率、状态、上线时间、最后提交时间的显示
* 新增币种ETHW、ETHF、ERG、NEOX、FIRO
* 历史版本信息可[点击此处](https://github.com/ycyw/mymp/releases)查看
