//
//  UserDefaults+Ext.swift
//  Yummie
//
//  Created by mahmoud yousef on 23/10/2022.
//

import Foundation

extension UserDefaults{
    
    private enum UserDefaultsKeys:String {
        case hasOnboarded
    }
    
    
    var hasOnboarded:Bool {
        set{ setValue(newValue, forKey: UserDefaultsKeys.hasOnboarded.rawValue) }
        get{ bool(forKey: UserDefaultsKeys.hasOnboarded.rawValue) }
    }
    
}
