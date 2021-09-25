//
//  Bundle-Decodable.swift
//  Moon Shot
//
//  Created by Soft Xpert on 9/11/21.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Couldn't locate resource.")
        }
        
        guard let data = try? Data.init(contentsOf: url) else {
            fatalError("Couldn't load Data.")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let decoded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode data.")
        }
        
        return decoded
    }
}
