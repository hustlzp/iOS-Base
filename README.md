iOS-Base
========

Instructions for iOS project.

## 添加.gitignore

```
wget https://raw.githubusercontent.com/github/gitignore/master/Swift.gitignore
mv Swift.gitignore .gitignore
```

## 使用CocoaPods管理依赖

```
pod init
```

添加常用第三方库：

* [SnapKit](https://github.com/SnapKit/SnapKit)
* [Alamofire](https://github.com/Alamofire/Alamofire)
* [Fabric](https://fabric.io)
* [Crashlytics](https://get.fabric.io/crashlytics)
* [Localize_Swift](https://github.com/marmelroy/Localize-Swift)
* [ionicons-iOS](https://github.com/sweetmandm/ionicons-iOS)
* [MBProgressHUD](https://github.com/jdg/MBProgressHUD)
* [SDWebImage](https://github.com/rs/SDWebImage)
* [SwiftyStoreKit](https://github.com/bizz84/SwiftyStoreKit)
* [PromiseKit](https://github.com/mxcl/PromiseKit)
* [SwiftyUserDefaults](https://github.com/radex/SwiftyUserDefaults)
* [UMeng](https://umeng.com)

```
pod 'SnapKit'
pod 'Fabric'
pod 'Crashlytics'
pod 'Alamofire'
pod 'ionicons'
pod 'SDWebImage'
pod 'MBProgressHUD'
pod 'SwiftyStoreKit'
pod 'Localize-Swift'
pod 'PromiseKit'
pod 'SwiftyUserDefaults'
pod 'UMCCommon'
pod 'UMCSecurityPlugins'
pod 'UMCAnalytics'
pod 'UMCShare/Social/ReducedWeChat'
pod 'UMCShare/Social/ReducedQQ'
pod 'UMCShare/Social/ReducedSina'
pod 'UMCShare/Social/Facebook'
pod 'UMCShare/Social/Twitter'
```

并运行：

```
pod install
```

然后打开`*.xcworkspace`即可。

CocoaPods[官网](https://cocoapods.org)。

## 项目结构

* Controllers：控制器
* Models：模型
* Views：视图
* Extensions：扩展
* Additions：额外的第三方库
* Utils：组件
* Constants.swift：常量

在XCode中建立Group，并将Group与文件夹关联起来。

## 去除storyboard

* 删除`Info.plist`中的`Main Storyboard file base name`项
* 在`application:didFinishLaunchingWithOptions:`中添加如下代码：

```swift
window = UIWindow(frame: UIScreen.main.bounds)
window?.rootViewController = ViewController()
window?.backgroundColor = UIColor.white
window?.makeKeyAndVisible()
```

## 崩溃记录

使用[Fabric](https://fabric.io)。

## 本地化

将 `generatetr.js`, `genstrings.swift` 拷贝到项目根目录。

修改 `generatetr.js` 中的 `projectDir` 变量。

在项目中添加 `zh-Hans`, `zh-Hant`, `zh-Hant-TW` 本地化支持。

在项目中新建 `Localizable.strings`, `InfoPlist.strings` 文件，并为它们添加本地化支持。

```
npm init
npm install opencc
npm generatetr.js
```
