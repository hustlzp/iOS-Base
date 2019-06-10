import UIKit

struct Font {
    static let WenTingFont = "FZLTTHK--GBK1-0"
}

struct NotificationName {
    static let logOut = Notification.Name("logoutNotification")
    static let logIn = Notification.Name("logInNotification")
}

struct Size {
    static var statusBarHeight: CGFloat {
        return safeAreaInsetsTop > 0 ? safeAreaInsetsTop : 20
    }
    static var navigationBarWithoutStatusHeight: CGFloat {
        if Device.isPad, #available(iOS 12.0, *) {
            return 50
        } else {
            return 44
        }
    }
    static var navigationBarHeight: CGFloat = navigationBarWithoutStatusHeight + statusBarHeight
    static var tabBarHeight: CGFloat {
        if Device.isPad, #available(iOS 12.0, *) {
            return 50 + Size.onePixel
        } else {
            return 49 + Size.onePixel
        }
    }
    static var screenWidth: CGFloat {
        return UIApplication.shared.keyWindow?.bounds.width ?? UIScreen.main.bounds.width
    }
    static var screenHeight: CGFloat {
        return UIApplication.shared.keyWindow?.bounds.height ?? UIScreen.main.bounds.height
    }
    static let screenMinLength = min(UIScreen.main.bounds.size.height, UIScreen.main.bounds.size.width)
    static let screenMaxLength = max(UIScreen.main.bounds.size.height, UIScreen.main.bounds.size.width)
    static var horizonalGap: CGFloat {
        if Device.isPhone {
            if Device.isSmallPhone {
                return 18
            } else {
                return 20
            }
        } else {
            return 48
        }
    }
    static let onePixel = 1 / UIScreen.main.scale
    static var safeAreaInsetsTop: CGFloat {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            
            let safeAreaInsetsTop = window?.safeAreaInsets.top ?? 0
            
            if safeAreaInsetsTop == 20 {
                return 0
            } else {
                return safeAreaInsetsTop
            }
        } else {
            return 0
        }
    }
    static var safeAreaInsetsBottom: CGFloat {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            
            return window?.safeAreaInsets.bottom ?? 0
        } else {
            return 0
        }
    }
}

struct Device {
    static let isPhone = UIDevice.current.userInterfaceIdiom == .phone
    static let isSmallPhone = Device.isPhone && Int(Size.screenMinLength) <= 320
    static let isBigPhone = Device.isPhone && Int(Size.screenMinLength) >= 414
    static let isNormalPhone = Device.isPhone && !Device.isSmallPhone && !Device.isBigPhone
    
    static let isPad = UIDevice.current.userInterfaceIdiom == .pad
    static var isVertical: Bool {
        return Size.screenWidth < Size.screenHeight
    }
    
    static var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        return identifier
    }
}
