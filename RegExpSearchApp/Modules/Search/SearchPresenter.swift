//
//  SearchPresenter.swift
//  RegExpSearchApp
//
//  Created by Лилия Левина on 21.03.2022.
//

import Foundation

protocol SearchViewInputProtocol: AnyObject {
    func updateView(data: [String])
    func updateView(data: SearchModel)
}

protocol SearchInteractorInputProtocol: AnyObject {
    func getSearchData()
    func getFilteredData(model: SearchModel)
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
    
    //MARK: SearchViewOutputProtocol
    func viewDidLoad() {
        self.interactor.getSearchData()
    }
    
    func searchButtonTapped(model: SearchModel) {
        self.interactor.getFilteredData(model: model)
    }
    
    //MARK: SearchInteractorOutputProtocol
    func searchDataFetched(model: SearchModel) {
        self.view?.updateView(data: model)
    }
    
    func dataFetched(data: [String]) {
        self.view?.updateView(data: data)
        self.router.showResultScene(result: data)
    }
}
