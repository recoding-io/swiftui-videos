//
//  App_LockApp.swift
//  App Lock
//
//  Created by Haaris Iqubal on 5/12/21.
//

import SwiftUI

@main
struct App_LockApp: App {
    @StateObject var appLockVM = AppLockViewModel()
    @Environment(\.scenePhase) var scenePhase
    
    @State var blurRadius: CGFloat = 0
    var body: some Scene {
        
        WindowGroup {
            ContentView()
                .environmentObject(appLockVM)
                .blur(radius: blurRadius)
                .onChange(of: scenePhase, perform: { value in
                    switch value{
                    case .active:
                        blurRadius = 0
                    case .background:
                        appLockVM.isAppUnlocked = false
                    case .inactive:
                        blurRadius = 5
                    @unknown default:
                        print("unknown")
                    }
                })
        }
    }
}
