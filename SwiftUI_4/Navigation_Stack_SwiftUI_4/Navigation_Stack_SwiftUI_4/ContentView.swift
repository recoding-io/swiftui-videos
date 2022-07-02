//
//  ContentView.swift
//  Navigation_Stack_SwiftUI_4
//
//  Created by Haaris Iqubal on 6/17/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var navigationModel = NavigationModel()
    
    var body: some View {
        NavigationViewSource()
            .environmentObject(navigationModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
