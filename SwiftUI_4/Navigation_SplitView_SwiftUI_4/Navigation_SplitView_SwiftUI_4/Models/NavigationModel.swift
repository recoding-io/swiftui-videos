//
//  NavigationModel.swift
//  Navigation_SplitView_SwiftUI_4
//
//  Created by Haaris Iqubal on 7/24/22.
//

import SwiftUI
import Combine

enum ColumnTypes: Int, Identifiable, CaseIterable, Codable{
    var id: Int {rawValue}
    
    case twoColumnLayout
    case threeColumnLayout
    
    var localizedName: LocalizedStringKey{
        switch self {
        case .twoColumnLayout:
            return "Two Column Layout"
        case .threeColumnLayout:
            return "Three Column Layout"
        }
    }
}

enum ColumnNavigationVisibility: Int, Identifiable, CaseIterable{
    var id: Int{rawValue}
    
    case all
    case doubleColumn
    case detailOnly
    case automatic
    
    var localizedName:LocalizedStringKey{
        switch self {
        case .all:
            return "All"
        case .doubleColumn:
            return "Double Column"
        case .detailOnly:
            return "Detail Only"
        case .automatic:
            return "Automatic"
        }
    }
}

class NavigationModel: ObservableObject{
    @Published var isSheet:Bool = false
    @Published var selectedColumnVisibility: NavigationSplitViewVisibility = .all
    @Published var selectedColumnLayout: ColumnTypes = .threeColumnLayout
    @Published var selectedCategory: Category? = .mac
    @Published var selectedDevice: Device?
    
    public func setColumnVisibility(columnType: ColumnNavigationVisibility) -> NavigationSplitViewVisibility{
        switch columnType{
        case .all:
            return .all
        case .doubleColumn:
            return .doubleColumn
        case .detailOnly:
            return .detailOnly
        case .automatic:
            return .automatic
        }
    }
}
