//
//  CD_CRUD_MVVMApp.swift
//  Shared
//
//  Created by Haaris Iqubal on 12/29/21.
//

import SwiftUI

@main
struct CD_CRUD_MVVMApp: App {
    
    let persistenceController = PersistenceController.shared
    
    @StateObject var taskListViewModel = TaskListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(taskListViewModel)
        }
    }
}
