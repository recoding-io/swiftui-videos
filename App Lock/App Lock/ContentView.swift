//
//  ContentView.swift
//  App Lock
//
//  Created by Haaris Iqubal on 5/12/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appLockVM: AppLockViewModel
    var body: some View {
        ZStack{
            if !appLockVM.isAppLockEnabled || appLockVM.isAppUnlocked{
                AppHomeView().environmentObject(appLockVM)
            }
            else{
                AppLockView()
                    .environmentObject(appLockVM)
            }
        }
        .onAppear{
            if appLockVM.isAppLockEnabled{
                appLockVM.appLockValidation()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
