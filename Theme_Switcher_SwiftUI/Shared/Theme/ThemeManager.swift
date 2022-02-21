//
//  ThemeManager.swift
//  Theme_Switcher_SwiftUI
//
//  Created by Haaris Iqubal on 2/18/22.
//

import SwiftUI

class ThemeManager:ObservableObject{
    
    @AppStorage("selectedTheme") var themeSelected = 0
    
    static let shared = ThemeManager()
    public var themes:[Theme] = [GreenTheme(),OrangeTheme(),RedTheme()]
    @Published var selectedTheme:Theme = GreenTheme()
    
    init(){
        getTheme()
    }
    
    public func applyTheme(_ theme:Int){
        self.selectedTheme = self.themes[theme]
        self.themeSelected = theme
    }
    
    func getTheme(){
        self.selectedTheme = self.themes[themeSelected]
    }
    
}
