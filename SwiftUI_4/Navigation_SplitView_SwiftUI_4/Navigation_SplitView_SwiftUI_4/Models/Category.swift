//
//  Category.swift
//  Navigation_SplitView_SwiftUI_4
//
//  Created by Haaris Iqubal on 7/24/22.
//

import SwiftUI

enum Category: Int, Hashable, CaseIterable, Identifiable, Codable{
    case mac
    case iPad
    case iPhone
    case home
    
    var id: Int{rawValue}
    
    var localizedName: LocalizedStringKey{
        switch self{
        case .mac:
            return "Mac"
        case .iPad:
            return "iPad"
        case .iPhone:
            return "iPhone"
        case .home:
            return "Home"
        }
    }
}
