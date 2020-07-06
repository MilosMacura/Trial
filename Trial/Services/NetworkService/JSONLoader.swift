//
//  JsonLoader.swift
//  Trial
//
//  Created by Milos on 7/5/20.
//

import Foundation

class JSONLoader {
    
    static func loadJson<ParsedType: Decodable>(fileName: String) -> Result<ParsedType, APIError> {
        guard let file = Bundle(for: JSONLoader.self).path(forResource: fileName, ofType: "json") else {
            return .failure(.fileMissingError)
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: file), options: [])
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .millisecondsSince1970
            let response = try decoder.decode(ParsedType.self, from: data)
            return .success(response)
        } catch let error {
            assertionFailure("Got error \(error) while parsing transactions.")
            return .failure(.parsingError)
        }
    }
}
