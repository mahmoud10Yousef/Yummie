//
//  OnboardingSlide.swift
//  Yummie
//
//  Created by mahmoud yousef on 10/10/2022.
//

import UIKit

struct OnboardingSlide{
    
    let title       : String
    let description : String
    let image       : UIImage
    
    
    static func getSlides() -> [OnboardingSlide] {
        return  [
            OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2")),
            OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide1")),
            OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide3"))
        ]
    }
    
    
}
