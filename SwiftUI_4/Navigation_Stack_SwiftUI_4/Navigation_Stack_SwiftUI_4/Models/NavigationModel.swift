//
//  NavigationModel.swift
//  Navigation_Stack_SwiftUI_4
//
//  Created by Haaris Iqubal on 6/17/22.
//

import Foundation
import Combine

final class NavigationModel: ObservableObject{
    @Published var carPath: [Car]
    
    init(carPath: [Car] = []) {
        self.carPath = carPath
    }
    
    var selectedCar: Car? {
        get {carPath.first}
        set {carPath = [newValue].compactMap{$0}}
    }
}
