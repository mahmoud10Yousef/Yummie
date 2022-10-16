//
//  UIViewController+Ext.swift
//  Yummie
//
//  Created by mahmoud yousef on 15/10/2022.
//

import UIKit

extension UIViewController{
    
    static var identifier : String  {
        return String(describing: self)
    }
    
    static func instatiate() -> Self{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier) as! Self
    }
    
}
