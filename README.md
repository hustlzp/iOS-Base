iOS-Base
========

Instructions for iOS project.

##.gitignore

见[Objective-C.gitignore](https://github.com/github/gitignore/blob/master/Objective-C.gitignore)。

##使用CocoaPods管理依赖

CocoaPods使用方法见[官网](https://cocoapods.org)。

常用第三方库：

* [Masonry](https://github.com/SnapKit/Masonry)
* [AFNetworking](https://github.com/AFNetworking/AFNetworking)
* [MagicalRecord](https://github.com/magicalpanda/MagicalRecord)
* [Fabric](https://fabric.io)
* [Crashlytics](https://get.fabric.io/crashlytics)

##项目结构

* Controllers：控制器
* Models：模型
* Views：视图
* Categories：扩展
* Additions：额外的第三方库
* Utils：组件
* Constants.h：常量
* G.h / G.m：全局变量
* Seed.h / Seed.m：初始化数据

###崩溃记录

使用[Fabric](https://fabric.io)。

##常用工具

* [Reveal](http://revealapp.com)
* [mogenerator](https://github.com/rentzsch/mogenerator)
