import UIKit

class Utils: NSObject {
    class func dispatchAfter(_ second: Double, completion: (() -> Void)?) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(second * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
            completion?()
        }
    }

    class func generateImpactFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        
        generator.prepare()
        generator.impactOccurred()
    }

}
