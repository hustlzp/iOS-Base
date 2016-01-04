//
//  AutoLayoutLabel.swift
//  duowen
//
//  Created by hustlzp on 15/12/22.
//  Copyright © 2015年 hustlzp. All rights reserved.
//

import UIKit

class AutoLayoutLabel: UILabel {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        if numberOfLines == 0 {
            preferredMaxLayoutWidth = bounds.width
        }
    }
}
