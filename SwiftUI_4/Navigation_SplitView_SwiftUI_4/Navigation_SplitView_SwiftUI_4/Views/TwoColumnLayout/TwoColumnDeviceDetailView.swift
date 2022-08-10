//
//  TwoColumnDeviceDetailView.swift
//  Navigation_SplitView_SwiftUI_4
//
//  Created by Haaris Iqubal on 7/24/22.
//

import SwiftUI

struct TwoColumnDeviceDetailView: View {
    
    var device: Device?
    
    var body: some View {
        VStack{
            if device != nil{
                ScrollView{
                    VStack{
                        Image(device!.image)
                            .resizable()
                            .scaledToFit()
                        Text(device!.description)
                            .font(
                                .custom("AmericanTypewriter", fixedSize: 34))
                    }
                    .padding()
                    .navigationTitle(device!.name)
                }
            }
            else{
                VStack{
                    Text("No Device Selected Yet!")
                        .font(.title)
                }
            }
        }
    }
}

struct TwoColumnDeviceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TwoColumnDeviceDetailView(device: Device.devicesData[0])
    }
}
