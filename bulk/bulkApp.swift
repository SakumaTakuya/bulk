//
//  bulkApp.swift
//  bulk
//
//  Created by sakuma.takuya on 2023/11/03.
//

import SwiftUI
import SwiftData

@main
struct bulkApp: App {
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
//            ContentView(viewModel: RecordCollectionViewModel())
        }
        .modelContainer(sharedModelContainer)
    }
}
