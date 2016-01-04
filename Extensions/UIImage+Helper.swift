//
//  UIImage+Helper.swift
//  duowen
//
//  Created by hustlzp on 15/12/20.
//  Copyright © 2015年 hustlzp. All rights reserved.
//

import UIKit

extension UIImage {
    /**
     根据颜色创建UIImage
     
     - parameter color: <#color description#>
     
     - returns: <#return value description#>
     */
    class func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    /**
     根据颜色、尺寸创建UIImage
     
     - parameter color: <#color description#>
     - parameter size:  <#size description#>
     
     - returns: <#return value description#>
     */
    class func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}