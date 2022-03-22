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
    var logService: LoggingServiceProtocol!
    var model: SearchModel?
    
    init(view: SearchViewInputProtocol, interactor: SearchInteractorInputProtocol, logService: LoggingServiceProtocol) {
        self.view = view
        self.interactor = interactor
        self.logService = logService
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
        self.model = model
    }
    
    func dataFetched(data: [String]) {
        self.view?.updateView(data: data)
        self.router.showResultScene(result: data)
        guard let model = self.model, !model.resultFileName.isEmpty else { return }
        do {
            try logService.write(data, toDocumentNamed: model.resultFileName)
            print("Инфо записана в файл!)")
        } catch {
            print(error)
        }
    }
}
