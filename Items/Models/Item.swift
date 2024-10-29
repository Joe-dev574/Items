//
//  Item.swift
//  Items
//
//  Created by Joseph DeWeese on 10/28/24.
//

import SwiftUI
import SwiftData

@Model
final class Item {
    var title: String = ""
    var remark: String = ""
    var timestamp: Date = Date.now
    var dateAdded: Date = Date.now
    var dateStarted: Date = Date.distantPast
    var dateCompleted: Date = Date.distantPast
    var status: Status.RawValue = Status.Queue.rawValue
    @Relationship(deleteRule: .cascade)
    var notes: [Note]?
    @Relationship(inverse: \FocusTag.items)
    var focusTags: [FocusTag]?
    
    init(
        title: String,
        remark: String,
        timestamp: Date,
        dateAdded: Date = Date.now,
        dateStarted: Date = Date.distantPast,
        dateCompleted: Date = Date.distantPast,
        status: Status = .Queue
    ) {
        self.title = title
        self.remark = remark
        self.timestamp = timestamp
        self.dateAdded = dateAdded
        self.dateStarted = dateStarted
        self.dateCompleted = dateCompleted
        self.status = status.rawValue
    }
    
    
    var icon: Image {
        switch Status(rawValue: status)! {
        case .Queue:
            Image(systemName: "checkmark.diamond.fill")
        case .Active:
            Image(systemName: "book.fill")
        case .Completed:
            Image(systemName: "books.vertical.fill")
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
}
