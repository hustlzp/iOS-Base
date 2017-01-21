//
//  UIColor+Extensions.swift
//  duowen
//
//  Created by hustlzp on 15/12/16.
//  Copyright © 2015年 hustlzp. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hex: Int64) {
        self.init(red: (CGFloat)((hex >> 24) & 0xFF) / 255.0, green: (CGFloat)((hex >> 16) & 0xFF) / 255.0, blue: (CGFloat)((hex >> 8) & 0xFF) / 255.0, alpha: (CGFloat)((hex) & 0xFF) / 255.0)
    }
    
    convenience init(hexString: String) {
        var cString:String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: CGFloat(1.0))
    }
    
    func lighter(percentage: CGFloat) -> UIColor {
        var h: CGFloat = 0.0, s: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
        
        getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return UIColor(hue: h, saturation: s, brightness: min(b * (1 + percentage), 1), alpha: a)
    }
    
    func darker(percentage: CGFloat) -> UIColor {
        var h: CGFloat = 0.0, s: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
        
        getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return UIColor(hue: h, saturation: s, brightness: min(b * (1 - percentage), 1), alpha: a)
    }

}
