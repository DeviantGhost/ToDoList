//
//  APIHandler.swift
//  APIHPratice
//
//  Created by Carlon Rosales on 8/30/21.
//

import Foundation

class APIHandler {
    
    static let shared = APIHandler.init()
    typealias DidFinishDataAndError = ((Data?, Error?) -> ())?
    
    private init() {}
    
        func provideData(url: String, completionHandler: DidFinishDataAndError) -> Void {
            
            URLSession.shared.dataTask(with: URL.init(string: url)! ) { data, response, error in
                
                completionHandler?(data, error)
                
            }
        }
}
