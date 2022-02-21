//
//  SheetItemView.swift
//  Theme_Switcher_SwiftUI
//
//  Created by Haaris Iqubal on 2/18/22.
//

import SwiftUI

struct SheetItemView: View {
    
    @EnvironmentObject private var themeManager:ThemeManager
    
    var body: some View {
        ZStack{
            themeManager.selectedTheme.secondaryColor.ignoresSafeArea(.all)
            VStack{
                ForEach(0..<themeManager.themes.count){themeCount in
                    Button(action: {
                        withAnimation{
                            themeManager.applyTheme(themeCount)
                        }
                    }, label: {
                        Text("Change \(themeManager.themes[themeCount].themeName)")
                    })
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.roundedRectangle)
                .tint(.gray)
                
            }
        }
    }
}

struct SheetItemView_Previews: PreviewProvider {
    static var previews: some View {
        SheetItemView()
    }
}
