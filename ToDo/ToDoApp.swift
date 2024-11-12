//
//  ToDoApp.swift
//  ToDo
//
//  Created by macbook on 12/11/2024.
//

import SwiftUI

@main
struct ToDoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
