//
//  ThreeColumnMasterView.swift
//  Navigation_SplitView_SwiftUI_4
//
//  Created by Haaris Iqubal on 7/24/22.
//

import SwiftUI

struct ThreeColumnMasterView: View {
    @EnvironmentObject private var navigationModel: NavigationModel
    var category = Category.allCases
    
    
    
    var body: some View {
        NavigationSplitView(columnVisibility: $navigationModel.selectedColumnVisibility){
            List(category, selection: $navigationModel.selectedCategory){categories in
                NavigationLink(categories.localizedName,value: categories)
            }
            .navigationTitle("Categories")
            
        } content: {
            ThreeColumnDetailView()
                .toolbar{
                    Button(action: {
                        navigationModel.isSheet.toggle()
                    }, label: {
                        Label("Setting", systemImage: "gear")
                    })
                    .sheet(isPresented: $navigationModel.isSheet){
                        SettingView()
                    }
                }
        }
        detail: {
            TwoColumnDeviceDetailView(device: navigationModel.selectedDevice)
        }
    }
}

struct ThreeColumnMasterView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeColumnMasterView()
            .environmentObject(NavigationModel())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
