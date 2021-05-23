//
//  AppHomeView.swift
//  App Lock
//
//  Created by Haaris Iqubal on 5/12/21.
//

import SwiftUI
import Combine

struct AppHomeView:View {
    @EnvironmentObject var appLockVM:AppLockViewModel
    var body: some View{
        NavigationView{
            Form{
                Toggle(isOn: $appLockVM.isAppLockEnabled, label: {
                    Text("App Lock")
                })
                .onChange(of: appLockVM.isAppLockEnabled, perform: { value in
                    appLockVM.appLockStateChange(appLockState: value)
                })
            }
            .navigationTitle("App Home")
        }
    }
}
