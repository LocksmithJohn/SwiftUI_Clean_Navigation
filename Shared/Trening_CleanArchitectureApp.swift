//
//  Trening_CleanArchitectureApp.swift
//  Shared
//
//  Created by User on 18/07/2021.
//

import SwiftUI

@main
struct Trening_CleanArchitectureApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
