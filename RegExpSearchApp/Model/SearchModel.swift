//
//  SearchModel.swift
//  RegExpSearchApp
//
//  Created by Лилия Левина on 21.03.2022.
//

import Foundation

class SearchModel {
    var url: URL
    var filterString: String = ""
    
    init(url: URL, filterString: String) {
        self.url = url
        self.filterString = filterString
    }
}
