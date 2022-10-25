//
//  OnboardingPresenter.swift
//  Yummie
//
//  Created by mahmoud yousef on 25/10/2022.
//

import Foundation

protocol OnboardingCellView{
    func displayTitle(title:String)
    func displayDescription(description:String)
    func dispalyImage(image:String)
}

class OnboardingVCPresenter{
    var slides: [OnboardingSlide]
    
    init() {
        slides = OnboardingSlide.getSlides()
    }
    
    
    func getSlidesCount() -> Int {
        slides.count
    }
    
    func configure(cell:OnboardingCellView  , for index: Int ){
        let slide = slides[index]
        cell.displayTitle(title: slide.title)
        cell.displayDescription(description: slide.description)
        cell.dispalyImage(image: slide.image)
    }
    
}
