//
//  Core_Data_To_Do_AppApp.swift
//  Core-Data-To-Do-App
//
//  Created by Haaris Iqubal on 5/14/21.
//

import SwiftUI

@main
struct Core_Data_To_Do_AppApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
