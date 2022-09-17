<h1 align="center">
  <img src="https://cdn.jsdelivr.net/gh/ycyw/mymp@main/images/logo.png" width="230"/>
</h1>

<h4 align="center">矿池转发代理工具，独家自研零损耗抽水算法，超低内存使用率(单台矿机仅需0.3MB)</h4>

![Screenshot](https://cdn.jsdelivr.net/gh/ycyw/mymp@main/images/home1.jpg)
## :zap: 功能
* ETC、RVN、CFX币种矿池中转
* 独家自研零损耗抽水算法
* 自定义抽水率
* 动态修改抽水率
* 自定义矿池地址
* 支持跨矿池抽水
* 内置常用矿池地址
* 矿池显示的本地算力修改
* 支持TCP、SSL连接协议
* 内置SSL证书
* 算力曲线统计图表
* 全功能web网页操作
* 进程守护运行防止程序崩溃导致矿机掉线
* 更多功能开发中...
## :memo: 使用教程
* youtube视频教程：[https://youtu.be/1XXfNRHCo0k](https://youtu.be/1XXfNRHCo0k)
## :tada: 安装
* Linux系统一键管理脚本(自带崩溃重启)  
```shell
# 服务器中执行命令
bash <(curl -s -L https://cdn.jsdelivr.net/gh/ycyw/mymp@main/script/manage.sh)
```
```shell
# 再次连接服务器可以使用以下命令查看输出
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


## :bricks: 最新版本：v1.2（2022.09.16）
* 删除ETH相关代码
* 新增ETC、RVN、CFX币种
* 新增当前算力、平均算力、有效份额、无效份额字段显示
* 前端说明提示及统计图表优化
* *历史版本信息可[点击此处](https://github.com/ycyw/mymp/releases)查看*
