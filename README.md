iOS-Base
========

Instructions for iOS project.

##添加.gitignore

见[Objective-C.gitignore](https://github.com/github/gitignore/blob/master/Objective-C.gitignore)。

##使用CocoaPods管理依赖

```
pod init
```

然后添加第三方库，并运行：

```
pod install
```

然后打开`*.xcworkspace`即可。

常用第三方库：

* [Masonry](https://github.com/SnapKit/Masonry)
* [AFNetworking](https://github.com/AFNetworking/AFNetworking)
* [MagicalRecord](https://github.com/magicalpanda/MagicalRecord)
* [Fabric](https://fabric.io)
* [Crashlytics](https://get.fabric.io/crashlytics)
* [MBProgressHUD](https://github.com/jdg/MBProgressHUD)

CocoaPods[官网](https://cocoapods.org)。

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

在XCode中建立Group，并将Group与文件夹关联起来。

##去除storyboard

* 删除`Main.storyboard`、`ViewController.h`、`ViewController.m`
* 删除`Info.plist`中的`Main Storyboard file base name`项
* 在`application:didFinishLaunchingWithOptions:`中添加如下代码：
```objc
self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
[self.window setRootViewController:viewController];
self.window.backgroundColor = [UIColor whiteColor];
[self.window makeKeyAndVisible];

return YES;
```

##崩溃记录

使用[Fabric](https://fabric.io)。

##常用工具

* [Reveal](http://revealapp.com)
* [mogenerator](https://github.com/rentzsch/mogenerator)

