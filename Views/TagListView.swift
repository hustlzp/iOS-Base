//
//  TagListView.swift
//  duowen
//
//  Created by hustlzp on 15/12/19.
//  Copyright © 2015年 hustlzp. All rights reserved.
//

import UIKit

class TagListView: UIButton {

    var cornerRadius: CGFloat = 0.0
    var textColor = UIColor.blackColor()
    var paddingX: CGFloat = 5.0
    var paddingY: CGFloat = 2.0
    var tagBackgroundColor = UIColor.lightGrayColor()
    var tagSelectedBackgroundColor = UIColor.grayColor()
    var textFont = UIFont.systemFontOfSize(12)
    var marginX: CGFloat = 5.0
    var marginY: CGFloat = 2.0
    
    private var tagViews = [TagView]()
    private var rows = 0
    
    func addTag(title: String) -> TagView {
        let tagView = TagView(title: title)
        
        tagView.textColor = textColor
        tagView.tagBackgroundColor = tagBackgroundColor
        tagView.tagSelectedBackgroundColor = tagSelectedBackgroundColor
        tagView.cornerRadius = cornerRadius
        tagView.paddingY = paddingY
        tagView.paddingX = paddingX
        tagView.textFont = textFont
        
        tagViews.append(tagView)
        
        setNeedsLayout()
        layoutIfNeeded()
        
        return tagView
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        for tagView in tagViews {
            tagView.removeFromSuperview()
        }
        
        var currentRow = 0
        var currentRowTagCount = 0
        var currentRowWidth: CGFloat = 0;
        var tagViewWidth: CGFloat = 0.0
        var tagViewHeight: CGFloat = 0.0
        var tagViewX: CGFloat = 0.0
        var tagViewY: CGFloat = 0.0
        
        for tagView in tagViews {
            tagViewWidth = tagView.intrinsicContentSize().width
            tagViewHeight = tagView.intrinsicContentSize().height
            
            if currentRowTagCount == 0 || currentRowWidth + tagViewWidth + marginX > frame.width {
                currentRow += 1
                tagViewX = 0
                currentRowWidth = 0
            }
            
            tagViewX = currentRowWidth
            tagViewY = CGFloat(currentRow - 1) * (tagViewHeight + marginY)
            
            currentRowTagCount += 1
            currentRowWidth += tagViewWidth + marginX
            
            tagView.frame = CGRectMake(tagViewX, tagViewY, tagViewWidth, tagViewHeight)
            
            addSubview(tagView)
        }
        
        rows = currentRow
        
        snp_updateConstraints { (make) -> Void in
            make.height.equalTo(tagViewY + tagViewHeight)
        }
    }
    
    func removeAllTags() {
        for tagView in tagViews {
            tagView.removeFromSuperview()
        }
        
        tagViews.removeAll()
        
        rows = 0
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}
