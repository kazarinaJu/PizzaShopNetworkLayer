//
//  NetworkService.swift
//  dodo
//
//  Created by Юлия Ястребова on 19.04.2024.
//

import Foundation

public enum NetworkError: Error {
    case codeError
}

public protocol NetworkClientProtocol {
    func fetch(url: URL, completion: @escaping (Result<Data, Error>) -> Void)
}

public struct NetworkClient: NetworkClientProtocol {
    
    public init() {}
   
    public func fetch(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let response = response as? HTTPURLResponse,
               response.statusCode < 200 || response.statusCode >= 300 {
                
                completion(.failure(NetworkError.codeError))
                return
            }
            
            guard let data = data else { return }
            completion(.success(data))
        }
        task.resume()
    }
}
