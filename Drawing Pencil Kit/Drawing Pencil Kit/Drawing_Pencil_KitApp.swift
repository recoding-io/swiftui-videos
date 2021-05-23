//
//  Drawing_Pencil_KitApp.swift
//  Drawing Pencil Kit
//
//  Created by Haaris Iqubal on 5/7/21.
//

import SwiftUI

@main
struct Drawing_Pencil_KitApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
