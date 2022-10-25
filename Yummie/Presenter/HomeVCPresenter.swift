//
//  HomeVCPresenter.swift
//  Yummie
//
//  Created by mahmoud yousef on 25/10/2022.
//

import Foundation

protocol HomeView: AnyObject {
    func showLoadingView()
    func hideLoadingView()
    func fetchingDataSuccessfully()
    func showError(error:String)
}

@objc protocol DishCellView{
     func displayTitle(title : String )
     func displayImage(url: String )
     @objc optional func dispalyCalories(calories: String)
     @objc optional  func displayDescription(description:String)
    
}




class HomeVCPresenter{
    
     private weak var view: HomeView?
    
     private  var categories:[DishCategory]     = []
     private var populars : [Dish]              = []
     private var specials : [Dish]              = []
     private let  interactor: DishesAPIProtocol = DishesAPI()
     
    enum DishSection{ case categories , populars , specials }
    
    init(view: HomeView){
        self.view = view
    }
    
    func viewDidLoad(){
      fetchAllCategories()
    }
    
    
    private func fetchAllCategories(){
        view?.showLoadingView()
        
        interactor.fetchAllCategories { [weak self] result in
            guard let self = self else { return }
            self.view?.hideLoadingView()
            
            switch result{
            case .success(let allDishes):
                guard let dishes = allDishes?.data else { return }
                self.view?.fetchingDataSuccessfully()
                
                self.categories = dishes.categories!
                self.specials = dishes.specials!
                self.populars = dishes.populars!
                
            case .failure(let error):
                self.view?.showError(error: error.localizedDescription)
            }
        }
    }
    
    
    func getCountFor(section: DishSection) -> Int{
        switch section {
        case .categories:
            return self.categories.count
            
        case .populars:
            return self.populars.count
            
        case .specials:
            return self.specials.count
        }
    }
    
    
    
    func configure(cell: DishCellView ,for index:Int){
        let category = self.categories[index]
        cell.displayTitle(title: category.name ?? "")
        cell.displayImage(url: category.image ?? "")
    }
    
    
    func  configure(cell: DishCellView ,for index:Int , section: DishSection){
        let item:Dish =  (section == .populars) ? self.populars[index] : self.specials[index]
        
        cell.displayTitle(title: item.name ?? "")
        cell.displayImage(url: item.image ?? "")
        cell.displayDescription?(description: item.description ?? "")
        cell.dispalyCalories?(calories: item.formattedCalories ?? "0")
    }
    
    
}
