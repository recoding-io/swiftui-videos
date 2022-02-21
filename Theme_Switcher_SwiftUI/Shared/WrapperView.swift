//
//  WrapperView.swift
//  Theme_Switcher_SwiftUI
//
//  Created by Haaris Iqubal on 2/18/22.
//

import SwiftUI

struct WrapperView: View {
    
    @EnvironmentObject private var themeManager:ThemeManager
    
    var body: some View {
        ForEach(0..<themeManager.themes.count, id: \.self){themeCount in
            if themeManager.themes[themeCount].themeName == themeManager.selectedTheme.themeName{
                ContentView()
            }
        }
    }
}

struct WrapperView_Previews: PreviewProvider {
    static var previews: some View {
        WrapperView()
    }
}
