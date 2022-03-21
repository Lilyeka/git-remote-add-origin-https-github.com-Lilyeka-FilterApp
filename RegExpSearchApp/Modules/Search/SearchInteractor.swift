//
//  SearchInteractor.swift
//  RegExpSearchApp
//
//  Created by Лилия Левина on 21.03.2022.
//

import Foundation

protocol SearchInteractorOutputProtocol: AnyObject {
    func dataFetched(data: [String])
}

final class SearchInteractor: SearchInteractorInputProtocol {
    weak var presenter: SearchInteractorOutputProtocol?
    
    func getFilteredData() {
        print("Интерактор ищет данные")
        var dataArray = [
            "asb",
            "cmdlcnlsnkcklnclkdnclkdnvdlakvndlkndalfkvnadlfknvvdvdvcdcsdcsdcsddscssdsdcd",
            "sdnslkcnsdlcnsdkcnsadkncsaldkncaklsdncklasdnclkasdnclkansdlknadslcknakdslcnakalkdncldkncladknclkadnclkandsclkndslknaldkcnlakdnclakakndanlcknaldkladknclkadnclkandckl",
            "csdcscasdcasdcasdcasdcsdcscsccdscsdcadscc"
        ]
        self.presenter?.dataFetched(data: dataArray)
    }
}
