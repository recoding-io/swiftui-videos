//
//  ContentView.swift
//  Navigation_SplitView_SwiftUI_4
//
//  Created by Haaris Iqubal on 7/24/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var navigationModel: NavigationModel = NavigationModel()
    
    var body: some View {
        Group{
            switch navigationModel.selectedColumnLayout {
            case .twoColumnLayout:
                TwoColumnMasterView()
            case .threeColumnLayout:
                ThreeColumnMasterView()
            }
        }
        .environmentObject(navigationModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
