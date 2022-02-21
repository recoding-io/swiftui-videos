//
//  CustomModifiers.swift
//  Theme_Switcher_SwiftUI
//
//  Created by Haaris Iqubal on 2/18/22.
//

import SwiftUI

struct ListBackgroundColorModifier:ViewModifier{
    let backgroundColor:Color
    init(backgroundColor:Color){
        self.backgroundColor = backgroundColor
        UITableView.appearance().backgroundColor = UIColor(backgroundColor)
    }
    func body(content: Content) -> some View {
        content
    }
}

extension List{
    func listBackgroundModifier(backgroundColor:Color)-> some View{
        self.modifier(ListBackgroundColorModifier(backgroundColor: backgroundColor))
    }
}


struct NavigationBarCustomModifier:ViewModifier{
    init(backgroundColor: UIColor,foregroundColor: UIColor,largeTextAttributesColor: UIColor,tintColor: UIColor? = nil,hideseperator:Bool = false) {
      let coloredAppearance = UINavigationBarAppearance()
      coloredAppearance.configureWithOpaqueBackground()
      coloredAppearance.backgroundColor = backgroundColor
      coloredAppearance.titleTextAttributes = [.foregroundColor: foregroundColor]
      coloredAppearance.largeTitleTextAttributes = [.foregroundColor: largeTextAttributesColor]
        if hideseperator {
            UINavigationBar.appearance().tintColor = .clear
        }
      UINavigationBar.appearance().standardAppearance = coloredAppearance
      UINavigationBar.appearance().compactAppearance = coloredAppearance
      UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        if let tintColor = tintColor {
            UINavigationBar.appearance().tintColor = tintColor
        }
    }
    
    func body(content: Content) -> some View {
        content
    }
}

extension View{
    func navigationBarModifier(backgroundColor: UIColor,foregroundColor: UIColor,largeTextAttributesColor: UIColor,tintColor: UIColor? = nil,hideseperator:Bool = false) -> some View {
        self.modifier(NavigationBarCustomModifier(backgroundColor: backgroundColor,foregroundColor: foregroundColor,largeTextAttributesColor: largeTextAttributesColor,tintColor: tintColor,hideseperator: hideseperator))
    }
}
