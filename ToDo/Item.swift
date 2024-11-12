//
//  Item.swift
//  ToDo
//
//  Created by macbook on 12/11/2024.
//
import SwiftData
import Foundation

@Model
class Item {
    var timestamp: Date
    
    init(timestamp: Date = .now) {
        self.timestamp = timestamp
    }
}
