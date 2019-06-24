import UIKit
import AVFoundation
import Photos

class Utils: NSObject {
    class func dispatchAfter(_ second: Double, completion: (() -> Void)?) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(second * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
            completion?()
        }
    }

    class func generateImpactFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        
        generator.impactOccurred()
    }
    
    // MARK: Permissions
    
    class func checkCameraAuthDenied() -> Bool {
        return AVCaptureDevice.authorizationStatus(for: AVMediaType.video) == .denied
    }
    
    class func checkAlbumAuthDenied() -> Bool {
        return PHPhotoLibrary.authorizationStatus() == .denied
    }
    
    class func checkMicrophoneAuthDenied() -> Bool {
        return AVAudioSession.sharedInstance().recordPermission == .denied
    }
    
    class func checkRegisteredForRemoteNotifications() -> Bool {
        return UIApplication.shared.isRegisteredForRemoteNotifications
    }
    
    class func openSettingsViewController() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    // MARK: Show permission request alert
    
    class func showPermissionReuqestAlert(_ controller: UIViewController, title: String) {
        let alertController = UIAlertController(title: nil, message: title, preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "去设置", style: .default) { (_) in
            self.openSettingsViewController()
        }
        alertController.addAction(settingsAction)
        
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        controller.present(alertController, animated: true, completion: nil)
    }
    
    class func showAlbumPermissionReuqestAlert(_ controller: UIViewController) {
        showPermissionReuqestAlert(controller, title: "请允许XXX访问您的照片".localized())
    }
    
    class func showCameraPermissionReuqestAlert(_ controller: UIViewController) {
        showPermissionReuqestAlert(controller, title: "请允许XXX使用您的相机".localized())
    }
    
    class func showMicrophonePermissionRequestAlert(_ controller: UIViewController) {
        showPermissionReuqestAlert(controller, title: "请允许XXX使用您的麦克风".localized())
    }

}
