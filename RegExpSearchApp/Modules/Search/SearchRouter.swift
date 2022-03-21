//
//  SearchRouter.swift
//  RegExpSearchApp
//
//  Created by Лилия Левина on 21.03.2022.
//

import Foundation

final class SearchRouter: SearchRouterProtocol {
    weak var view: SearchViewController?
    
    init(viewController: SearchViewController) {
        self.view = viewController
    }
    
    func showResultScene(result: [String]) {
        let resultVC = ResultViewController()
        resultVC.dataSourceArray = result
        self.view?.navigationController?.pushViewController(resultVC, animated: true)
    }
    
    
}
