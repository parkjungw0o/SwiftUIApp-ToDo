//
//  ToDoApp.swift
//  ToDo
//
//  Created by 박정우 on 8/4/24.
//

import SwiftUI
import SwiftData


@main
struct ToDoApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            
            Todo.self
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
}
