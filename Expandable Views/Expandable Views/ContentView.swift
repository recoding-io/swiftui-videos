//
//  ContentView.swift
//  Expandable Views
//
//  Created by Haaris Iqubal on 5/19/21.
//

import SwiftUI

struct ContentView: View {
    let items = DirectoryData.items
    @State private var textField = ""
    @State private var textField2 = ""
    var body: some View {
        NavigationView{
            List{
                Section(header:Text("Outline View")){
                    ForEach(items){item in
                        DisclosureGroup("\(Image(item.icon)) \(item.name)"){
                        OutlineGroup(item.children ?? [Directory](), children:\.children){child in
                            if child.children == nil{
                                NavigationLink(destination: Text(child.name)){
                                    Image(systemName: child.icon)
                                    Text(child.name)
                                }
                            }
                            else{
                                Label(child.name, systemImage:child.icon)
                            }

                            }
                        }
                    }
                }
                
                Section(header:Text("Disclosure View")){
                    DisclosureGroup("Settings Form"){
                        Section(header: Text("Personal Info")){
                            TextField("Enter your name", text: $textField)
                            TextField("Enter your country",text: $textField2)
                        }
                        Section(header: Text("Preference")){
                            Toggle("Dark Mode", isOn:.constant(true))
                            Toggle("Notification", isOn:.constant(false))
                        }
                    }
                }
                
            }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("Expandable Views")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
