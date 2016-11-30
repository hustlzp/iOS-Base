iOS-Base
========

Instructions for iOS project.

##添加.gitignore

见[Swift.gitignore](https://raw.githubusercontent.com/github/gitignore/master/Swift.gitignore)。

##使用CocoaPods管理依赖

```
pod init
```

添加常用第三方库：

* [SnapKit](https://github.com/SnapKit/SnapKit)
* [Alamofire](https://github.com/Alamofire/Alamofire)
* [Fabric](https://fabric.io)
* [Crashlytics](https://get.fabric.io/crashlytics)
* [ionicons-iOS](https://github.com/sweetmandm/ionicons-iOS)
* [FontAwesome+iOS](https://github.com/alexdrone/ios-fontawesome)
* [MBProgressHUD](https://github.com/jdg/MBProgressHUD)
* [leancloud-feedback-ios](https://github.com/leancloud/leancloud-feedback-ios)

```
pod 'SnapKit'
pod 'Fabric'
pod 'Crashlytics'
pod 'Alamofire'
pod 'ionicons'
pod 'MBProgressHUD'
pod 'LeanCloudFeedback'
```

并运行：

```
pod install
```

然后打开`*.xcworkspace`即可。

CocoaPods[官网](https://cocoapods.org)。

##项目结构

* Controllers：控制器
* Models：模型
* Views：视图
* Extensions：扩展
* Additions：额外的第三方库
* Utils：组件
* Constants.swift：常量

在XCode中建立Group，并将Group与文件夹关联起来。

##去除storyboard

* 删除`Main.storyboard`、`ViewController.swift`
* 删除`Info.plist`中的`Main Storyboard file base name`项
* 在`application:didFinishLaunchingWithOptions:`中添加如下代码：
```objc
window = UIWindow(frame: UIScreen.mainScreen().bounds)
window.rootViewController = controller
window?.backgroundColor = UIColor.whiteColor()
window?.makeKeyAndVisible()

return true
```

##崩溃记录

使用[Fabric](https://fabric.io)。
