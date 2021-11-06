//
//  ContentView.swift
//  Shared
//
//  Created by Haaris Iqubal on 10/12/21.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        NavigationView{
            PrimaryView()
                .navigationTitle("Searchable")
//            SecondaryView()
//                .navigationTitle("Secondary")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
