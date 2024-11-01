//
//  ItemsApp.swift
//  Items
//
//  Created by Joseph DeWeese on 10/28/24.
//

import SwiftUI
import SwiftData

@main
struct ItemsApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
        
       
    }
    init( ) {
        print("Begin:")
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
        print(":End")
    }
}
