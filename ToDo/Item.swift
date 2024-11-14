//
//  Item.swift
//  ToDo
//
//  Created by macbook on 12/11/2024.
//
import SwiftData
import Foundation

@Model
class Item: Identifiable {
    var id = UUID()  // Unique identifier for each Item
    var timestamp: Date
    var desc: String
    var priority: String
    
    static let priorities = ["⭐️", "⭐️⭐️", "⭐️⭐️⭐️"]
    
    init(timestamp: Date = .now, desc: String = "", priority: String = "⭐️") {
        self.timestamp = timestamp
        self.desc = desc
        self.priority = priority
    }
}

