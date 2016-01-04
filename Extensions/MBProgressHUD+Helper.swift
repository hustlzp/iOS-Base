//
//  MBProgressHUD+Helper.swift
//  duowen
//
//  Created by hustlzp on 15/12/25.
//  Copyright © 2015年 hustlzp. All rights reserved.
//

import UIKit
import MBProgressHUD
import ionicons

extension MBProgressHUD {
    func hideForSuccess(text: String?) {
        hideForSuccess(text, completion: nil)
    }
    
    func hideForSuccess(text: String?, completion: (() -> Void)?) {
        labelText = text ?? nil
        mode = .CustomView
        customView = UIImageView(image: IonIcons.imageWithIcon(ion_checkmark, size: 37, color: UIColor.whiteColor()))
        Utils.dispatchAfter(1) { () -> Void in
            self.hide(true)
            completion?()
        }
    }
    
    func hideForError(text: String?) {
        hideForError(text, completion: nil)
    }
    
    func hideForError(text: String?, completion: (() -> Void)?) {
        labelText = text ?? nil
        mode = .CustomView
        customView = UIImageView(image: IonIcons.imageWithIcon(ion_close, size: 37, color: UIColor.whiteColor()))
        Utils.dispatchAfter(1) { () -> Void in
            self.hide(true)
            completion?()
        }
    }

}
