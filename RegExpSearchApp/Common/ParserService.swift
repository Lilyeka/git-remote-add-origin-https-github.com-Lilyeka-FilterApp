//
//  ParserService.swift
//  RegExpSearchApp
//
//  Created by Лилия Левина on 22.03.2022.
//

import Foundation

protocol ParserServiceProtocol {
    func parse(object: FilePartProtocol, filter: String) -> [String]
}

final class ParserService: ParserServiceProtocol {
    func parse(object: FilePartProtocol, filter: String) -> [String] {
        var resultArray:[String] = []
        var nextString = object.getNextPart()
        while nextString != nil {
            if (nextString!.contains(filter)) {
                resultArray.append(nextString!)
            }
            nextString = object.getNextPart()
        }
        return resultArray
    }
}
