//
//  Core_Data_Order_ListApp.swift
//  Shared
//
//  Created by Haaris Iqubal on 1/10/22.
//

import SwiftUI

@main
struct Core_Data_Order_ListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
