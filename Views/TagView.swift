//
//  TagView.swift
//  duowen
//
//  Created by hustlzp on 15/12/19.
//  Copyright © 2015年 hustlzp. All rights reserved.
//

import UIKit

class TagView: UIButton {

    var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    var textColor = UIColor.blackColor() {
        didSet {
            setTitleColor(textColor, forState: .Normal)
        }
    }
    
    var paddingX: CGFloat = 5.0 {
        didSet {
            contentEdgeInsets.left = paddingX
            contentEdgeInsets.right = paddingX
        }
    }
    
    var paddingY: CGFloat = 2.0 {
        didSet {
            contentEdgeInsets.top = paddingY
            contentEdgeInsets.bottom = paddingY
        }
    }
    
    var tagBackgroundColor = UIColor.lightGrayColor() {
        didSet {
            backgroundColor = tagBackgroundColor
        }
    }
    
    var tagSelectedBackgroundColor = UIColor.grayColor()
    
    var textFont = UIFont.systemFontOfSize(12) {
        didSet {
            titleLabel?.font = textFont
        }
    }
    
    var onTap: (() -> Void)?
    
    // MARK: Life Cycle
    
    init(title: String) {
        super.init(frame: CGRect.zero)
        setTitle(title, forState: .Normal)
        addTarget(self, action: "tagPressed", forControlEvents: .TouchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: User Interface
    
    func tagPressed() {
        backgroundColor = tagSelectedBackgroundColor
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(0.2 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
            self.backgroundColor = self.tagBackgroundColor
            self.onTap?()
        }
    }
}
