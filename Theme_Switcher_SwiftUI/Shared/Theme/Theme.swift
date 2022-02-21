//
//  Theme.swift
//  Theme_Switcher_SwiftUI
//
//  Created by Haaris Iqubal on 2/18/22.
//

import SwiftUI

protocol Theme{
    var primaryColor:Color {get set}
    var secondaryColor:Color {get set}
    var labelColor:Color {get set}
    var themeName:String {get set}
}
