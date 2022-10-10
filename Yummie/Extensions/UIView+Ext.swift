//
//  UIView+Ext.swift
//  Yummie
//
//  Created by mahmoud yousef on 10/10/2022.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius:CGFloat{
        set{ self.layer.cornerRadius = newValue}
        get{ self.layer.cornerRadius }
    }
    
}
