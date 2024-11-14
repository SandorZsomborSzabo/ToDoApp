//
//  ContentView.swift
//  ToDo
//
//  Created by macbook on 12/11/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var items: [Item]
    
    @State private var isPresentingDescriptionPrompt = false
    @State private var newItemDescription: String = ""
    @State private var selectedPriority: String = "⭐️"  // Default priority

    var body: some View {
        VStack {
            // Trigger insert action
            Button(action: {
                isPresentingDescriptionPrompt = true
            }, label: {
                Text("Add Item")
            })
            
            // Display fetched data as List
            List {
                ForEach(items) { item in
                    VStack(alignment: .leading) {
                        Text(item.timestamp.formatted())
                        Text("Description: \(item.desc)")
                        Text("Priority: \(item.priority)") // Display priority
                    }
                }
            }
        }
        // Sheet for entering item description and selecting priority
        .sheet(isPresented: $isPresentingDescriptionPrompt) {
            VStack {
                Text("Enter a short overview of the task:")
                    .font(.headline)
                    .padding()
                
                TextField("Description", text: $newItemDescription)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Choose the priority of the task:")
                    .font(.headline)
                    .padding()
                
                // Picker for selecting priority as a dropdown
                Picker("Select Priority", selection: $selectedPriority) {
                    ForEach(Item.priorities, id: \.self) { priority in
                        Text(priority).tag(priority)
                    }
                }
                .padding()
                
                Button("Add") {
                    addItem(description: newItemDescription, priority: selectedPriority)
                    newItemDescription = ""
                    selectedPriority = "Low"  // Reset to default priority
                    isPresentingDescriptionPrompt = false
                }
                .padding()
            }
            .padding()
        }
    }
    
    // Insert new data with description and priority
    func addItem(description: String, priority: String) {
        let item = Item(desc: description, priority: priority)
        modelContext.insert(item)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
