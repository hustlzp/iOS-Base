import UIKit

class Utils: NSObject {
    class func dispatchAfter(second: Double, completion: (() -> Void)?) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(second * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
            completion?()
        }
    }

    class func dispatchInMainQueue(completion: () -> Void) {
        dispatch_async(dispatch_get_main_queue()) {
            () -> Void in
            completion()
        }
    }
}
