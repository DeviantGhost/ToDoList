//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Carlon Rosales on 9/21/21.
//

import SwiftUI
import Firebase

@main
struct ToDoListApp: App {
    
    init(){
        
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    
}
