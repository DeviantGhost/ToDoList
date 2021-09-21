//
//  ContentView.swift
//  ToDoList
//
//  Created by Carlon Rosales on 9/21/21.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State private var name: String = ""
    
    @ObservedObject private var viewModel = ContactViewModel()

    var body: some View {
        
        NavigationView {
            List(viewModel.contacts) { contact in
                VStack(alignment: .leading) {
                    Text(contact.name!).font(.title)
                }
            }.onAppear() {
                self.viewModel.fetchData()
            }
            
        }.toolbar {
            ToolbarItem(placement: .bottomBar) {
                HStack {
                    TextField("Enter your name", text: $name)
                        .frame(minWidth: 100, idealWidth: 150, maxWidth: 240, minHeight: 30, idealHeight: 40, maxHeight: 50, alignment: .leading)
                    Spacer()
                    Button(action: {
                        self.viewModel.addData(name: name)
                        print("button tapped!")
                    }) {
                        HStack {
                            Image(systemName: "plus")
                                .font(.title)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(40)
                    }
                }
            }
        }
    }
}
