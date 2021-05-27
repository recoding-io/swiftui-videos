//
//  ContentView.swift
//  NativeSearchBar
//
//  Created by Haaris Iqubal on 5/26/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var searchBar: SearchBar = SearchBar()
    
    var items = DataItems.items
    var body: some View {
        NavigationView{
            List(items.filter({searchBar.text.isEmpty ? true : $0.name.localizedStandardContains(searchBar.text)})){ item in
                Text(item.name)
            }
            .add(self.searchBar)
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Search Bar App")
        }
            .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
