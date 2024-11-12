//
//  ContentView.swift
//  ToDo
//
//  Created by macbook on 12/11/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // Responsible for data manipulation (Insert, Update & Delete)
    @Environment(\.modelContext) var modelContext
    
    // Used for fetching data
    @Query var items: [Item]
    
    var body: some View {
        VStack {
            // Trigger insert action
            Button(action: {
                addItem()
            }, label: {
                Text("Add Item")
            })
            
            // Display fetched data as List
            List {
                ForEach(items) { item in
                    Text(item.timestamp.formatted())
                }
            }
        }
    }
    
    // Insert new data
    func addItem() {
        var item = Item()
        modelContext.insert(item)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
