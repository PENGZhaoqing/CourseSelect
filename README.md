# CourseSelect

这个样本系统是基于国科大研究生课程(高级软件工程)开发的项目,目的是帮助入门者学习RoR(Ruby on Rails),这是适合新学者的入手的第一个项目

入门者可以在这个样本系统上增加更多的功能:

* 处理选课冲突、控制选课人数
* 统计选课学分,增加选课的开放、关闭功能
* 自定义管理员后台
* 基于OAuth的授权登陆
* Excel格式的数据导入

## 说明

* 使用[Bootstrap](http://getbootstrap.com/)作为前端库
* 使用[Rails_admin Gem](https://github.com/sferik/rails_admin)作为后台管理

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

在浏览器中输入'localhost:3000'访问主页

##使用





