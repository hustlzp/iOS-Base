//
//  NSDate+Helper.swift
//  duowen
//
//  Created by hustlzp on 15/12/18.
//  Copyright © 2015年 hustlzp. All rights reserved.
//

import Foundation

extension NSDate {
    func friendlyInterval() -> String {
        var friendlyString = ""
        
        let interval = -timeIntervalSinceNow
        
        if interval < 5 {
            friendlyString = "刚刚"
        } else if interval < 60 {
            friendlyString = "\(Int(interval))秒"
        } else if interval < 3600 {
            friendlyString = "\(Int(interval / 60))分钟"
        } else if interval < 3600 * 24 {
            friendlyString = "\(Int(interval / 3600))小时"
        } else if interval < 3600 * 24 * 30 {
            friendlyString = "\(Int(interval / (3600 * 24)))天"
        } else if interval < 3600 * 24 * 365 {
            friendlyString = "\(Int(interval / (3600 * 24 * 30)))个月"
        } else {
            friendlyString = "\(Int(interval / (3600 * 24 * 365)))年"
        }
        
        return friendlyString
    }
}