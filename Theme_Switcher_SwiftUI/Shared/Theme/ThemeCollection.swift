//
//  ThemeCollection.swift
//  Theme_Switcher_SwiftUI
//
//  Created by Haaris Iqubal on 2/18/22.
//

import Foundation
import SwiftUI

final class GreenTheme:Theme{
    var primaryColor: Color = Color("1-PrimaryColor")
    
    var secondaryColor: Color = Color("1-SecondaryColor")
    
    var labelColor: Color = Color("LabelColor")
    
    var themeName: String = "Green Theme"
}

final class OrangeTheme:Theme{
    var primaryColor: Color = Color("2-PrimaryColor")
    
    var secondaryColor: Color = Color("2-SecondaryColor")
    
    var labelColor: Color = Color("LabelColor")
    
    var themeName: String = "Orange Theme"
}

final class RedTheme:Theme{
    var primaryColor: Color = Color("3-PrimaryColor")
    
    var secondaryColor: Color = Color("3-SecondaryColor")
    
    var labelColor: Color = Color("LabelColor")
    
    var themeName: String = "Red Theme"
}
