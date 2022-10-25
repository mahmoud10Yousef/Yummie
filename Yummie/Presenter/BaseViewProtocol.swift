//
//  BaseViewProtocol.swift
//  Yummie
//
//  Created by mahmoud yousef on 25/10/2022.
//

import Foundation

protocol BaseView {
    func showLoadingView()
    func hideLoadingView()
    func fetchingDataSuccessfully()
}
