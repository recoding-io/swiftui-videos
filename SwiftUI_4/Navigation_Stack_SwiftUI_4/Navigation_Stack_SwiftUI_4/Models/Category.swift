//
//  Category.swift
//  Navigation_Stack_SwiftUI_4
//
//  Created by Haaris Iqubal on 6/17/22.
//

import SwiftUI


enum Category: Int, Hashable, CaseIterable, Identifiable, Codable {
case superCars, classics, street
    var id: Int {rawValue}
    
    var localizedName: LocalizedStringKey{
        switch self {
        case .superCars:
            return "Super Cars"
        case .classics:
            return "Classics"
        case .street:
            return "Street"
        }
    }
}
