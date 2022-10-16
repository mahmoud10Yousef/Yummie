//
//  CardView.swift
//  Yummie
//
//  Created by mahmoud yousef on 15/10/2022.
//

import UIKit

class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    
    private func configure(){
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = .zero
        layer.shadowOpacity = 0.1
        layer.shadowRadius  = 10
        cornerRadius        = 10
    }
    
    
}
