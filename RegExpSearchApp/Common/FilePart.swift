//
//  FilePart.swift
//  RegExpSearchApp
//
//  Created by Лилия Левина on 22.03.2022.
//

import Foundation

protocol FilePartProtocol {
    var fileUrl: URL { get set }
    var fileSize: Double { get }
    var partSize: Double { get set }
   
    func getNextPart() -> String?
}
 
final class FilePart: FilePartProtocol {
    var fileUrl: URL
    var fileSize: Double
    var partSize: Double
    
    var numberOfParts: Int {
        return Int((fileSize/partSize).rounded().nextUp)
    }
    var lastrPartSize: Double {
        let roundedDownNumberOfParts = Int((fileSize/partSize).rounded().nextDown)
        if roundedDownNumberOfParts < numberOfParts {
            return (fileSize - Double(roundedDownNumberOfParts) * partSize)
        }
        return 0.0
    }
    var currentPartIndex: Int = 1
  
    init(fileUrl: URL, fileSize: Double, partSize: Double) {
        self.fileUrl = fileUrl
        self.fileSize = fileSize
        self.partSize = partSize
    }
    
    func getNextPart() -> String? {
        let dataArray = [
            "abs",
            "cmdlcnabs",
            "sdnslkcnsdlcnsdkcnsadkncsaldkncaklsdnckla",
            "csdcscasdcasdcasdcasdcsdcscsccdscsdcabsdscc"
        ]
        let currentPartIndexCopy = self.currentPartIndex
        if self.currentPartIndex <= self.numberOfParts {
            self.currentPartIndex += 1
        } else {
            return nil
        }
        return dataArray[currentPartIndexCopy - 1]
    }
}
