//
//  tinyTimerApp.swift
//  tinyTimer
//
//  Created by Sermet Cagan on 23.06.2023.
//

import SwiftUI

@main
struct tinyTimerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
