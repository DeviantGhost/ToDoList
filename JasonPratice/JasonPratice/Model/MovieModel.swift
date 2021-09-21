//
//  MovieModel.swift
//  JasonPratice
//
//  Created by Carlon Rosales on 8/12/21.
//

import Foundation

struct MovieModel:Codable {
    var results:[Results]? = []
}

struct Results:Codable {
    var backdrop_path   : String?
    var title           : String?
    var popularity      : Double?
    var release_date    : String?
    var genre           : String?
}
