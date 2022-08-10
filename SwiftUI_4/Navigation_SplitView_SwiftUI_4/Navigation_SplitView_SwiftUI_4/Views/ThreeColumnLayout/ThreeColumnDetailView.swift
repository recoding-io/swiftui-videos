//
//  ThreeColumnDetailView.swift
//  Navigation_SplitView_SwiftUI_4
//
//  Created by Haaris Iqubal on 7/24/22.
//

import SwiftUI

struct ThreeColumnDetailView: View {
    @EnvironmentObject private var navigationModel: NavigationModel
    let devices = Device.devicesData
    
    var body: some View {
        List(devices.filter{$0.category == navigationModel.selectedCategory}, selection: $navigationModel.selectedDevice){device in
            NavigationLink(device.name, value: device)
        }
        .navigationTitle("Devices")
    }
}

struct ThreeColumnDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeColumnDetailView()
            .environmentObject(NavigationModel())
    }
}
