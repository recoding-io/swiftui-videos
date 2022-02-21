//
//  Theme_Switcher_SwiftUIApp.swift
//  Shared
//
//  Created by Haaris Iqubal on 2/18/22.
//

import SwiftUI

@main
struct Theme_Switcher_SwiftUIApp: App {
    
    @StateObject var themeManager = ThemeManager()
    
    var body: some Scene {
        WindowGroup {
            WrapperView()
                .environmentObject(themeManager)
        }
    }
}
