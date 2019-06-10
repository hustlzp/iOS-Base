//
//  ZNError.swift
//  zennote
//
//  Created by hustlzp on 2019/6/8.
//  Copyright © 2019 hustlzp. All rights reserved.
//

import UIKit

class IBError: LocalizedError {
    static let cancel = ZNError("取消".localized())
    static let signIn = ZNError("请登录账户".localized())
    static let dataError = ZNError("数据格式错误".localized())
    
    private var desc: String!
    var errorDescription: String? {
        return desc
    }
    
    init(_ desc: String) {
        self.desc = desc
    }
    
}
