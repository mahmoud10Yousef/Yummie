//
//  OnboardingViewController.swift
//  Yummie
//
//  Created by mahmoud yousef on 10/10/2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView : UICollectionView!
    @IBOutlet weak var pageControl    : UIPageControl!
    @IBOutlet weak var nextBtn        : UIButton!
    
    let slides:[OnboardingSlide] = OnboardingSlide.getSlides()
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
            configureNextBtnTitle()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = slides.count
    }
    
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentPage < slides.count - 1 {
            scrollToNextSlide()
        } else{
            navigateToHomeScreen()
        }
    }
    
    
    private func scrollToNextSlide(){
        currentPage += 1
        let indexPath = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
    private func navigateToHomeScreen(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as! UINavigationController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle   = .flipHorizontal
        present(vc, animated: true)
    }
    
    
    private func configureNextBtnTitle(){
        if currentPage < slides.count - 1 {
            nextBtn.setTitle("Next", for: .normal)
        }else{
            nextBtn.setTitle("Get Started", for: .normal)
        }
    }
    
}

extension OnboardingViewController : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.reusueID, for: indexPath) as! OnboardingCollectionViewCell
        cell.set(slides[indexPath.item])
        return cell
    }
    
}


extension OnboardingViewController : UICollectionViewDelegate{
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width )
    }
    
}


extension OnboardingViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
}
