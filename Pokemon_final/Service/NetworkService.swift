//
//  NetworkService.swift
//  Pokemon_final
//
//  Created by ksd on 09/03/2022.
//

import Foundation


/**
 NetworkService kaldes for at hente generisk JSON.
 Den mangler en del check på resultatet.
 */

struct NetworkService {
    static func fetchData(from url: URL) async throws -> Data? {
        
        let session = URLSession.shared
        let (data, response) = try await session.data(from: url)
        let httpResponse = response as! HTTPURLResponse
        if httpResponse.statusCode == 200 {
            return data
        }
        else {
            return nil
        }
    }
}
