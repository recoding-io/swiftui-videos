//
//  TwoColumnMasterView.swift
//  Navigation_SplitView_SwiftUI_4
//
//  Created by Haaris Iqubal on 7/24/22.
//

import SwiftUI

struct TwoColumnMasterView: View {
    @EnvironmentObject private var navigationModel: NavigationModel
    var category = Category.allCases
    
    var body: some View {
        NavigationSplitView(columnVisibility: $navigationModel.selectedColumnVisibility){
            List(category,selection: $navigationModel.selectedCategory){categories in
                NavigationLink(categories.localizedName, value: categories)
            }
            .navigationTitle("Category")
            
        } detail: {
            NavigationStack{
                TwoColumnDetailView(category: navigationModel.selectedCategory)
            }
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
    }
}

struct TwoColumnMasterView_Previews: PreviewProvider {
    static var previews: some View {
        TwoColumnMasterView()
            .environmentObject(NavigationModel())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
