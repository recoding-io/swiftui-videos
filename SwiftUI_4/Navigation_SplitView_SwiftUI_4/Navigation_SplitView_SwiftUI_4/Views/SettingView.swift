//
//  SettingView.swift
//  Navigation_SplitView_SwiftUI_4
//
//  Created by Haaris Iqubal on 7/24/22.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject private var navigationModel: NavigationModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Form{
            Section("Column Type"){
                ForEach(ColumnTypes.allCases){column in
                    Button(action: {
                        navigationModel.selectedColumnLayout = column
                    }, label: {
                        Text(column.localizedName)
                    })
                }
            }
            
            Section("Column Visibility"){
                ForEach(ColumnNavigationVisibility.allCases){
                    visible in
                    Button(action: {
                        navigationModel.selectedColumnVisibility = navigationModel.setColumnVisibility(columnType: visible)
                    }, label: {
                        Text(visible.localizedName)
                    })
                }
            }
            
            Button(action: {
                dismiss()
            }, label: {
                Text("Close")
            })
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .environmentObject(NavigationModel())
    }
}
