//
//  ContentView.swift
//  Shared
//
//  Created by Haaris Iqubal on 8/25/21.
//

import SwiftUI

struct PreviewData: Identifiable{
    let id = UUID()
    var name:String
    var icon:String
    var color:Color
}

struct ExampleStruct {
    static var data = [
        PreviewData(name: "Item 1", icon: "car", color: .red),
        PreviewData(name: "Item 2", icon: "star", color: .yellow),
        PreviewData(name: "Item 3", icon: "info", color: .gray)
    ]
}

struct ContentView: View {
    
    let demoData = ExampleStruct.data
    @State private var selection: Set<UUID> = []
    var body: some View {
        NavigationView{
            List(selection: $selection){
                Section(header: Text("Demo Data")){
                    ForEach(demoData, id: \.id){item in
                        Label{
                            Text(item.name)
                        } icon:{
                            Image(systemName: item.icon)
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: true){
                            VStack{
                                Button(action: {}, label: {
                                    Label("Delte", systemImage: "trash")
                                })
                                    .tint(.red)
                                Button(action: {}, label: {
                                    Label("Info",systemImage: "info")
                                })
                                    .tint(.gray)
                            }
                        }
                        .swipeActions(edge: .leading, allowsFullSwipe: true){
                            Button(action: {}, label: {
                                Label("Favourite", systemImage: "star")
                            })
                                .tint(.yellow)
                        }
                        #if os(iOS)
//                        .listRowSeparator(.hidden)
                        .listRowSeparatorTint(item.color)
                        #endif
                        .listItemTint(item.color)
                    }
                }
                .headerProminence(.increased)
                Section(header:Text("Second Section")){
                    Text("Hello")
                    Text("World")
                }
            }
            .listStyle(.grouped)
            .listSectionSeparator(.hidden,edges: .all)
            #if os(macOS)
            .listStyle(.inset(alternatesRowBackgrounds: true))
            #endif
            #if os(iOS)
            .toolbar{
                EditButton()
            }
            #endif
            .navigationTitle("List Swift UI 3")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
