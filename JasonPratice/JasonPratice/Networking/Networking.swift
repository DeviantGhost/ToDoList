//
//  Networking.swift
//  JasonPratice
//
//  Created by Carlon Rosales on 8/13/21.
//

import Foundation

class Networking {

    func response (url: String  , completion: @escaping (MovieModel) -> ()) {
        guard let url = URL(string: url) else {return}
        URLSession.shared.dataTask(with: url, completionHandler: { (data , response , error ) in
            self.urlCompletionHandler(data: data, response: response, error: error, completion: completion)
            }).resume()
    }
    
    func urlCompletionHandler (data: Data?  , response : URLResponse? , error : Error? , completion: (MovieModel) -> ()) {
        guard let data = data else {return}
        do {
            let jsondecoder = JSONDecoder()
            let movies = try jsondecoder.decode(MovieModel.self, from: data)
            completion(movies)
        
        } catch {
            print("Error \(error)")
        }
    }

}
