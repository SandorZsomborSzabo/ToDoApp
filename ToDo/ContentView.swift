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
    
    // Controls the sheet visibility for entering the description
    @State private var isPresentingDescriptionPrompt = false
    
    // Stores the user's input for the description
    @State private var newItemDescription: String = ""
    
    var body: some View {
        VStack {
            // Trigger insert action
            Button(action: {
                isPresentingDescriptionPrompt = true  // Show the description input sheet
            }, label: {
                Text("Add Item")
            })
            
            // Display fetched data as List
            List {
                ForEach(items) { item in
                    VStack(alignment: .leading) {
                        Text(item.timestamp.formatted())  // Display timestamp
                        Text(item.desc)            // Display description
                    }
                }
            }
        }
        // Sheet for entering item description
        .sheet(isPresented: $isPresentingDescriptionPrompt) {
            VStack {
                Text("Enter Item Description")
                    .font(.headline)
                    .padding()
                
                TextField("Description", text: $newItemDescription)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Add") {
                    addItem(desc: newItemDescription)  // Add item with user-provided description
                    newItemDescription = ""                   // Clear the text field
                    isPresentingDescriptionPrompt = false     // Dismiss the sheet
                }
                .padding()
            }
            .padding()
        }
    }
    
    // Insert new data with description
    func addItem(desc: String) {
        let item = Item(desc: desc)  // Create Item with description
        modelContext.insert(item)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
