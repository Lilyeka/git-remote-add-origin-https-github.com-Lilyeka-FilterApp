//
//  ReaderService.swift
//  RegExpSearchApp
//
//  Created by Лилия Левина on 22.03.2022.
//

import Foundation

protocol ReaderServiceProtocol {
    func readFile(url: URL) -> FilePartProtocol
}

final class ReaderService: ReaderServiceProtocol {
    func readFile(url: URL) -> FilePartProtocol {
        // Чтение файла, определение его размера, а также размера его частей
        let fileSize: Double = 200.0
        let partSize: Double = 50.0
        
        let filePart = FilePart(fileUrl: url, fileSize: fileSize, partSize: partSize)
        return filePart
    }
}
