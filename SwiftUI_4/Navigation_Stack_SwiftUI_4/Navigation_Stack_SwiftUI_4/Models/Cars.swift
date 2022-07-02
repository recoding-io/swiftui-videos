//
//  Cars.swift
//  Navigation_Stack_SwiftUI_4
//
//  Created by Haaris Iqubal on 6/17/22.
//

import Foundation


struct Car: Hashable, Identifiable {
    let id = UUID()
    var name: String
    var category: Category
    var description: String
    var image: String? = nil
}

extension Car {
    static var mock: Car{
        DataModel.shared.carMock
    }
}
