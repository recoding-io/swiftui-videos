//
//  CD_Many_To_Many_RelationshipApp.swift
//  Shared
//
//  Created by Haaris Iqubal on 2/3/22.
//

import SwiftUI

@main
struct CD_Many_To_Many_RelationshipApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
