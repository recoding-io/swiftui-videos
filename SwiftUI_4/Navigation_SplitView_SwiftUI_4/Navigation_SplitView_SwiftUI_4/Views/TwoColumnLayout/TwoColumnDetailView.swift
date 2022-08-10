//
//  TwoColumnDetailView.swift
//  Navigation_SplitView_SwiftUI_4
//
//  Created by Haaris Iqubal on 7/24/22.
//

import SwiftUI

struct TwoColumnDetailView: View {
    var category: Category?
    let data = Device.devicesData
    
    let column: [GridItem] = [GridItem(.adaptive(minimum: 240))]
    var body: some View {
        ScrollView{
            if category != nil{
                LazyVGrid(columns: column){
                    ForEach(data.filter{$0.category == category}) { datum in
                        NavigationLink(value: datum){
                            VStack{
                                Image(datum.image)
                                    .resizable()
                                    .frame(height: 180)
                                Text(datum.name)
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle("Devices")
                .navigationDestination(for: Device.self){device in
                    TwoColumnDeviceDetailView(device: device)
                }
            }
        }
    }
}

struct TwoColumnDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TwoColumnDetailView(category: .mac)
    }
}
