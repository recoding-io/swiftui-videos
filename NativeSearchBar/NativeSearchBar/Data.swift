//
//  Data.swift
//  NativeSearchBar
//
//  Created by Haaris Iqubal on 5/26/21.
//

import Foundation

struct Data:Identifiable {
    var id = UUID()
    let name:String
    
    init(_ name:String) {
        self.name = name
    }
}

struct DataItems {
    static let items = [
        Data("Hello"),Data("World"),Data("Welcome"),Data("To"),Data("Recoding"),Data("Hope"),Data("You"),Data("Like"), Data("The"), Data("Video"), Data("And"), Data("Please"), Data("Do"), Data("Share"), Data("And"), Data("Subscribe")
    ]
}
