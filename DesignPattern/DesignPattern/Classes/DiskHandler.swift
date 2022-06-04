//
//  DiskHandler.swift
//  DesignPattern
//
//  Created by Gawade, Amar on 5/7/22.
//

import Foundation
// Handle writing and loading from disk
final class DiskHandler {
    static let decoder = JSONDecoder()
    static let encoder = JSONEncoder()
    
    static func createDocumentURL(forName fileName: String) -> URL {
        let fileManager = FileManager.default
        let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        return url.appendingPathComponent(fileName).appendingPathExtension(StringConstant.json)
    }
    
    static func save<T: Codable>(_ object: T, to fileName: String) throws {
        do {
            let url = createDocumentURL(forName: fileName)
            let data = try encoder.encode(object)
            try data.write(to: url, options: .atomic)
        } catch(let error) {
            print("Unable to save object to \(fileName): \(error)")
            throw error
        }
    }
    
    static func retrieve<T: Codable>(_ type: T.Type, from fileName: String) throws -> T {
        let url = createDocumentURL(forName: fileName)
        return try retrieve(T.self, from: url)
    }
    
    static func retrieve<T: Codable>(_ type: T.Type, from url: URL) throws -> T {
        do {
            let data = try Data(contentsOf: url)
            return try decoder.decode(T.self, from: data)
        } catch(let error) {
            print("Unable to retrive object from \(url): \(error)")
            throw error
        }
    }
}
