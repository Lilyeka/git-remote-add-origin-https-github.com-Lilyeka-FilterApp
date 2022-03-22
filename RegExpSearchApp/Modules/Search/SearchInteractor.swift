//
//  SearchInteractor.swift
//  RegExpSearchApp
//
//  Created by Лилия Левина on 21.03.2022.
//

import Foundation

protocol SearchInteractorOutputProtocol: AnyObject {
    func dataFetched(data: [String])
    func searchDataFetched(model: SearchModel)
}

final class SearchInteractor: SearchInteractorInputProtocol {
    weak var presenter: SearchInteractorOutputProtocol?
    var readerService: ReaderService!
    var parserService: ParserService!
    
    init(readerService: ReaderService, parserService: ParserService) {
        self.readerService = ReaderService()
        self.parserService = ParserService()
    }
    
    func getSearchData() {
        let fileURL = URL(fileURLWithPath: "https://google.com")
        var model = SearchModel(url: fileURL, filterString: "abs")
        self.presenter?.searchDataFetched(model: model)
    }
    
    func getFilteredData(model: SearchModel) {
        let filePart = readerService.readFile(url: model.url)
        var parsedStrings = parserService.parse(object: filePart, filter: model.filterString)
        self.presenter?.dataFetched(data: parsedStrings)
    }
}
