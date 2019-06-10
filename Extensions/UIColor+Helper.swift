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
    static var main: UIColor {
        return UIColor(hex: 0x000000)
    }
    
    convenience init(hex: Int64) {
        self.init(red: (CGFloat)((hex >> 16) & 0xFF) / 255.0, green: (CGFloat)((hex >> 8) & 0xFF) / 255.0, blue: (CGFloat)(hex & 0xFF) / 255.0, alpha: 1)
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
