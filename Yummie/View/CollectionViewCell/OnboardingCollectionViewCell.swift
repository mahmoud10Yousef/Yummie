//
//  OnboardingCollectionViewCell.swift
//  Yummie
//
//  Created by mahmoud yousef on 10/10/2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell , OnboardingCellView {
 
    static let reusueID = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView      : UIImageView!
    @IBOutlet weak var slideTitleLbl       : UILabel!
    @IBOutlet weak var slideDescriptionLbl : UILabel!
    
    
    func displayTitle(title: String) {
        slideTitleLbl.text = title
    }
    
    
    func displayDescription(description: String) {
        slideDescriptionLbl.text = description
    }
    
    
    func dispalyImage(image: String) {
        slideImageView.image = UIImage(named: image)
    }
   
    
}
