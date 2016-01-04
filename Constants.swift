import UIKit

struct Font {
    static let WenTingFont = "FZLTTHK--GBK1-0"
}

struct Color {
    static let mainColor = UIColor.colorWithRGBA(0xF6F5F3FF);
}

struct Notification {
    static let logOut = "logoutNotification"
    static let logIn = "logInNotification"
}

struct Size {
    static let statusBarHeight: CGFloat = 20
    static let navigationBarHeight: CGFloat = 64
    static let navigationBarWithoutStatusHeight = navigationBarHeight - statusBarHeight
    static let tabBarHeight: CGFloat = 49
    static let screenWidth = UIScreen.mainScreen().bounds.size.width
    static let screenHeight = UIScreen.mainScreen().bounds.size.height
}

struct Device {

}
