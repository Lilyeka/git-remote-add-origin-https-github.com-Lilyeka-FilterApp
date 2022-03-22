//
//  LoggingService.swift
//  RegExpSearchApp
//
//  Created by Лилия Левина on 22.03.2022.
//

import Foundation

protocol LoggingServiceProtocol {
    func write(_ object: String, toDocumentNamed documentName: String) throws
    func write(_ objects: [String], toDocumentNamed documentName: String) throws
}

struct LoggingService: LoggingServiceProtocol {
    
    var manager = FileManager.default

    func write(_ object: String,toDocumentNamed documentName: String) throws {
        let rootFolderURL = try manager.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false
        )

        let nestedFolderURL = rootFolderURL.appendingPathComponent("RegExpSearchAppFiles")

        do {
            try manager.createDirectory(
                at: nestedFolderURL,
                withIntermediateDirectories: false,
                attributes: nil
            )
        } catch CocoaError.fileWriteFileExists {
            // Folder already existed
        } catch {
            throw error
        }
            
        let fileURL = nestedFolderURL.appendingPathComponent(documentName)
        try object.write(to: fileURL, atomically: false, encoding: .utf8)
    }
    
    func write(_ objects: [String], toDocumentNamed documentName: String) throws {
        let joinedObjects = objects.joined(separator: "\n")
        
        do {
            try write("", toDocumentNamed: documentName)
            try write(joinedObjects, toDocumentNamed: documentName)
        } catch {
            throw error
        }
    }
}
