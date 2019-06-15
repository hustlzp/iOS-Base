import UIKit

extension UIView {
    func calSize(atWidth width: CGFloat = Size.screenWidth) -> CGSize {
        frame = CGRect(x: 0, y: 0, width: width, height: 0)
        setNeedsLayout()
        layoutIfNeeded()
        
        return systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
    
    func resetFrame() {
        setNeedsLayout()
        layoutIfNeeded()
        
        let size = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)

        frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    }
    
    func resetFrame(atWidth width: CGFloat) {
        frame = CGRect(x: 0, y: 0, width: width, height: 0)
        
        setNeedsLayout()
        layoutIfNeeded()

        let size = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        var newframe = frame
        newframe.size.height = size.height
        frame = newframe
    }
    
    // MARK: - Border
    
    class func createHorizonalBorderView(_ color: UIColor = UIColor.border, width: CGFloat = Size.onePixel) -> UIView {
        let border = UIView()
        
        border.backgroundColor = color
        
        border.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(width)
        }
        
        return border
    }
    
    class func createVerticalBorderView(_ color: UIColor = UIColor.border, width: CGFloat = Size.onePixel) -> UIView {
        let border = UIView()
        
        border.backgroundColor = color
        
        border.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(width)
        }
        
        return border
    }
    
    func addTopBorder(_ color: UIColor = UIColor.border, width: CGFloat = Size.onePixel) {
        let topBorder = UIView.createHorizonalBorderView(color, width: width)
        
        addSubview(topBorder)
        
        topBorder.snp.makeConstraints { (make) -> Void in
            make.top.left.right.equalTo(self)
        }
    }
    
    func addLeftBorder(_ color: UIColor = UIColor.border, width: CGFloat = Size.onePixel) {
        let border = UIView.createVerticalBorderView(color, width: width)
        
        addSubview(border)
        
        border.snp.makeConstraints { (make) -> Void in
            make.top.bottom.left.equalTo(self)
        }
    }
    
    func addBottomBorder(_ color: UIColor = UIColor.border, width: CGFloat = Size.onePixel) {
        let bottomBorder = UIView.createHorizonalBorderView(color, width: width)
        
        addSubview(bottomBorder)
        
        bottomBorder.snp.makeConstraints { (make) -> Void in
            make.bottom.left.right.equalTo(self)
        }
    }
    
    func addRightBorder(_ color: UIColor = UIColor.border, width: CGFloat = Size.onePixel) {
        let border = UIView.createVerticalBorderView(color, width: width)
        
        addSubview(border)
        
        border.snp.makeConstraints { (make) -> Void in
            make.top.bottom.right.equalTo(self)
        }
    }
    
    func addBorder(_ color: UIColor = UIColor.border, width: CGFloat = Size.onePixel) {
        addTopBorder(color, width: width)
        addLeftBorder(color, width: width)
        addRightBorder(color, width: width)
        addBottomBorder(color, width: width)
    }
    
    // MARK: - Snapshot
    
    func snapshotForImage(opaque: Bool = true) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, opaque, 0)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
}
