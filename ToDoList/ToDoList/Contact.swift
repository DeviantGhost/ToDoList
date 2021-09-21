//
//  Contact.swift
//  ToDoList
//
//  Created by Carlon Rosales on 9/21/21.
//

import Foundation
import SwiftUI
struct Contact: Codable, Identifiable {
    
    var id: String = UUID().uuidString
    var name: String?

    
}
