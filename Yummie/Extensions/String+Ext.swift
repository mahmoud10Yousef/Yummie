//
//  String+Ext.swift
//  Yummie
//
//  Created by mahmoud yousef on 15/10/2022.
//

import Foundation

extension String {
    
    var asURL : URL? {
        return URL(string: self)
    }
    
}
