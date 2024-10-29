//
//  FocusTag.swift
//  Items
//
//  Created by Joseph DeWeese on 10/28/24.
//

import SwiftUI
import SwiftData

@Model
class FocusTag {
    var name: String = ""
    var color: String = "FF0000"
    var items: [Item]?
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
    
    var hexColor: Color {
        Color(hex: self.color) ?? .red
    }
}

