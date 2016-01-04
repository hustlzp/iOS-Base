//
//  PlaceholderTextField.swift
//  duowen
//
//  Created by hustlzp on 15/12/26.
//  Copyright © 2015年 hustlzp. All rights reserved.
//

import UIKit

class PlaceholderTextField: UITextField {

    var placeholderColor: UIColor?
    
    override func drawPlaceholderInRect(rect: CGRect) {
        if let placeholder = placeholder {
            (placeholder as NSString).drawInRect(rect, withAttributes: [NSFontAttributeName: font!, NSForegroundColorAttributeName: placeholderColor ?? UIColor.colorWithRGBA(0xC7C7CDFF)])
        }
    }

}
