//
//  OnboardingCollectionViewCell.swift
//  Yummie
//
//  Created by mahmoud yousef on 10/10/2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
     
    static let reusueID = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView      : UIImageView!
    @IBOutlet weak var slideTitleLbl       : UILabel!
    @IBOutlet weak var slideDescriptionLbl : UILabel!
    
    
    func set(_ slide: OnboardingSlide){
        slideImageView.image     = slide.image
        slideTitleLbl.text       = slide.title
        slideDescriptionLbl.text = slide.description
    }
    
}
