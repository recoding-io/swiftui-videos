//
//  Directory.swift
//  Expandable Views
//
//  Created by Haaris Iqubal on 5/19/21.
//

import SwiftUI

struct Directory:Identifiable {
    var id = UUID()
    let name:String
    let icon:String
    var children:[Directory]?
    init(name:String, icon:String, children: [Directory]? = nil) {
        self.name = name
        self.icon = icon
        self.children = children
    }
}

struct DirectoryData {
    static var items = [
        Directory(name:"Directory 1",icon: "rectangle.stack.fill",children: [
        Directory(name: "Sub Directory 1 1", icon: "folder",children: [
        Directory(name: "Sub Sub Directory 1 1 1", icon: "checkmark.square")
        ]),
        Directory(name: "Sub Directory 1 2", icon: "folder",children: [
            Directory(name: "Sub Sub Directory 1 1 1", icon: "checkmark.square")
            ])
        ]),
        Directory(name:"Directory 2", icon: "rectangle.stack.fill",children: [
            Directory(name: "Sub Directory 2 1", icon: "folder",children: [
                Directory(name: "Sub Sub Directory 2 1 1", icon: "checkmark.square")
                ]),
            Directory(name: "Sub Directory 2 2", icon: "folder",children: [
                Directory(name: "Sub Sub Directory 2 2 1", icon: "checkmark.square")
                ])
            ]),
        Directory(name:"Directory 3", icon: "rectangle.stack.fill",children: [
            Directory(name: "Sub Directory 3 1", icon: "folder",children: [
                Directory(name: "Sub Sub Directory 3 1 1", icon: "checkmark.square")
                ]),
            Directory(name: "Sub Directory 3 2", icon: "folder",children: [
                Directory(name: "Sub Sub Directory 3 2 1", icon: "checkmark.square")
                ])
            ])
    ]
}
