import UIKit
import SDWebImage

extension UIImageView {
    func sd_setImageWithURLString(_ urlString: String?, placeholderImage: UIImage? = nil, showIndicator: Bool = false, completion: ((Bool) -> Void)? = nil) {
        guard let urlString = urlString else {
            // 若 urlString 为空，则显示 placeholderImage
            sd_setImage(with: nil, placeholderImage: placeholderImage, options: SDWebImageOptions(rawValue: 0), context: nil)
            return
        }
        
        if showIndicator {
            sd_imageIndicator = SDWebImageActivityIndicator.gray
        }
        
        sd_setImage(with: URL(string: urlString), placeholderImage: placeholderImage, options: SDWebImageOptions(rawValue: 0)) { (image, _, _, _) in
            completion?(image != nil)
        }
    }
}
