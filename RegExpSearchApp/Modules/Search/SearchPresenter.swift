//
//  SearchPresenter.swift
//  RegExpSearchApp
//
//  Created by Лилия Левина on 21.03.2022.
//

import Foundation

protocol SearchViewInputProtocol: AnyObject {
    func updateView(data: String)
}

protocol SearchInteractorInputProtocol: AnyObject {
    func getData()
}

class SearchPresenter: SearchViewOutputProtocol, SearchInteractorOutputProtocol {
   
    weak var view: SearchViewInputProtocol?
    var interactor: SearchInteractorInputProtocol
    
    init(view: SearchViewInputProtocol, interactor: SearchInteractorInputProtocol ) {
        self.view = view
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        self.interactor.getData()
    }
    
    //MARK: SearchViewOutputProtocol
    func searchButtonTapped() {
        print("начинаем поиск!")
    }
    
    //MARK: SearchInteractorOutputProtocol
    func dataFetched(data: String) {
        self.view?.updateView(data: data)
    }
}
