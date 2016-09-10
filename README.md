# CourseSelect [![Build Status](https://travis-ci.org/PENGZhaoqing/CourseSelect.svg?branch=master)](https://travis-ci.org/PENGZhaoqing/CourseSelect)

这个样本系统是基于国科大研究生课程 (高级软件工程) 开发的项目,目的是帮助入门者学习RoR (Ruby on Rails)

适合新学者的入手的第一个项目，入门者可以在这个样本系统上增加更多的功能:

* 处理选课冲突、控制选课人数
* 统计选课学分，学位课等
* 增加选课的开放、关闭功能
* 自定义管理员后台
* 基于OAuth的授权登陆
* Excel格式的数据导入

### 目前功能：

* 多角色登陆（学生，老师，管理员）
* 学生动态选课，退课
* 老师动态增加，删除课程
* 老师对课程下的学生添加、修改成绩
* 权限控制：老师和学生只能看到自己相关课程信息

### 截图

<img src="/lib/screenshot1.png" width="700">  

<img src="/lib/screenshot2.png" width="700">

<img src="/lib/screenshot3.png" width="700">   

<img src="/lib/screenshot4.png" width="700">

## 说明

目前使用的库：

* 使用[Bootstrap](http://getbootstrap.com/)作为前端库
* 使用[Rails_admin Gem](https://github.com/sferik/rails_admin)作为后台管理

使用需要安装Bundler，Gem，Ruby，Rails等依赖环境

## 安装

在终端（MacOS或Linux）中执行以下代码

```
$ git clone https://github.com/PENGZhaoqing/CourseSelect
$ cd CourseSelect
$ bundle install
$ rake db:migrate
$ rake db:seed
$ rails s 
```

在浏览器中输入`localhost:3000`访问主页

##使用

1.学生登陆：

账号：`student1@test.com`

密码：`password`

2.老师登陆：

账号：`teacher1@test.com`

密码：`password`


3.管理员登陆：

账号：`admin@test.com`

密码：`password`

账号中数字都可以替换成2,3...等等

## How to Contribute

先fork此项目，在分支修改后，pull request到主分支

提问请到issues里创建，欢迎contributor！

如果觉得好，给项目点颗星吧～


