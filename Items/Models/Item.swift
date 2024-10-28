//
//  Item.swift
//  Items
//
//  Created by Joseph DeWeese on 10/28/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var title: String
    var remark: String
    var timestamp: Date
    var dateAdded: Date
    var dateStarted: Date
    
    var dateCompleted: Date
    var status: Status
    
    init(
        title: String,
        remark: String,
        timestamp: Date,
        dateAdded: Date,
        dateStarted: Date,
        dateCompleted: Date,
        status: Status
    ) {
        self.title = title
        self.remark = remark
        self.timestamp = timestamp
        self.dateAdded = dateAdded
        self.dateStarted = dateStarted
        self.dateCompleted = dateCompleted
        self.status = status
    }
}

enum Status: Int, Codable, Identifiable {
    case Queue, Active, Completed
    var id: Self {
        self
    }
    var descr: String {
        switch self {
        case .Queue: return "Queue"
                .uppercased()
            case .Active: return "Active"
                .uppercased()
        case .Completed: return "Completed"
                .uppercased()
        }
    }
}
