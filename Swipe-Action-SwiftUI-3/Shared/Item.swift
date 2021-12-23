//
//  Item.swift
//  Swipe-Action-SwiftUI-3
//
//  Created by Haaris Iqubal on 12/17/21.
//

import Foundation
import SwiftUI


struct Item:Identifiable,Equatable{
    var id = UUID()
    let name:String
    let icon:String
    let color:Color
    var isFavorite:Bool
    var isArchive:Bool
    
    static var ItemsData:[Item]{
        [
            Item(name: "Car", icon: "car", color: .red, isFavorite: false, isArchive: false),
            Item(name: "Bus", icon: "bus", color: .green, isFavorite: false, isArchive: false),
            Item(name: "Cycle", icon: "bicycle", color: .blue, isFavorite: false, isArchive: false),
            Item(name: "Airplane", icon: "airplane", color: .orange, isFavorite: false, isArchive: false),
            Item(name: "Scooter", icon: "scooter", color: .purple, isFavorite: true, isArchive: false),
            Item(name: "Walk", icon: "figure.walk", color: .mint, isFavorite: false, isArchive: true),
            Item(name: "Ferry", icon: "ferry", color: .indigo, isFavorite: false, isArchive: true),
            Item(name: "Tram", icon: "tram", color: .pink, isFavorite: true, isArchive: false),
            Item(name: "Electric Car", icon: "bolt.car.fill", color: .teal, isFavorite: true, isArchive: false),
            Item(name: "Bus Double Decker", icon: "bus.doubledecker", color: .black, isFavorite: false, isArchive: true)
        ]
    }
}
