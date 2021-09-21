//
//  ModelViewController.swift
//  APIHPratice
//
//  Created by Carlon Rosales on 8/27/21.
//

import Foundation


class DataViewModel {
    
    typealias DidFinish = (()->())
    
    var data: [DataStruct]?
    var error: Error?
    
    func provideData(completionHandler: DidFinish){
        APIHandler.shared.provideData(url: "https://jsonplaceholder.typicode.com/albums") { data, error in
            
            
        }
        
    }
}
