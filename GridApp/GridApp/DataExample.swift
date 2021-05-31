//
//  DataExample.swift
//  GridApp
//
//  Created by Haaris Iqubal on 5/31/21.
//

import Foundation


struct DataExample:Identifiable {
    var id = Int.random(in: 1..<100)
    let name:String
    let score  = Int.random(in: 1..<100)
    let date = Date()
    
    init(_ name:String) {
        self.name = name
    }
}

struct DataDemo {
    static let data = [
    DataExample("John"),DataExample("Doe"),DataExample("Allen"),DataExample("Phil"),DataExample("Jacob"),DataExample("Daemon"), DataExample("Alice"),DataExample("Alex")]
}
