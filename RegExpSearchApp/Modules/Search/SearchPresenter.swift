//
//  SearchPresenter.swift
//  RegExpSearchApp
//
//  Created by Лилия Левина on 21.03.2022.
//

import Foundation

protocol SearchViewInputProtocol: AnyObject {
    func updateView(data: [String])
}

protocol SearchInteractorInputProtocol: AnyObject {
    func getFilteredData()
}

protocol SearchRouterProtocol: AnyObject {
    func showResultScene(result: [String])
}

final class SearchPresenter: SearchViewOutputProtocol, SearchInteractorOutputProtocol {   
    weak var view: SearchViewInputProtocol?
    var interactor: SearchInteractorInputProtocol
    var router: SearchRouterProtocol!
    
    init(view: SearchViewInputProtocol, interactor: SearchInteractorInputProtocol ) {
        self.view = view
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        
    }
    
    //MARK: SearchViewOutputProtocol
    func searchButtonTapped() {
        self.interactor.getFilteredData()
        print("начинаем поиск!")
    }
    
    //MARK: SearchInteractorOutputProtocol
    func dataFetched(data: [String]) {
        self.view?.updateView(data: data)
        self.router.showResultScene(result: data)
    }
}
