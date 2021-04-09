//
//  NetworkManager.swift
//  DebarsheeBookCollection
//
//  Created by Debarshee on 4/6/21.
//

import Foundation

class NetworkManager {
    static let manager = NetworkManager()
    
    private init() {}
    
    func getData<T>(url: String, completion: @escaping (Result<T, AppError>) -> Void) where T: Decodable {
        guard let mainUrl = URL(string: url) else { completion(.failure(.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: mainUrl) { data, response, error in
            let completionOnMain: (Result<T, AppError>) -> Void = { result in
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            // error check when connecting to server
            guard error == nil else {
                completionOnMain(.failure(.serverError))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completionOnMain(.failure(.noResponse))
                return
            }
            
            // error check when getting the response
            switch response.statusCode {
            case 200...299:
                guard let mainData = data else {
                    completionOnMain(.failure(.noData))
                    return
                }
                do {
                    let obj = try JSONDecoder().decode(T.self, from: mainData)
                    completionOnMain(.success(obj))
                } catch {
                    print(error)
                    completionOnMain(.failure(.parsingError))
                }
                
            default:
                completionOnMain(.failure(.genericError("Error: Invalid Response")))
            }
        }
        .resume()
    }
}
