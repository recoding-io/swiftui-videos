//
//  DoubleNavigationView.swift
//  NavigationStackViewsAlternative
//
//  Created by Haaris Iqubal on 6/2/21.
//

import SwiftUI
import NavigationStack

struct DoubleNavigationView: View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink(
                    destination: SecondaryView(),
                    label: {
                        Text("Child View")
                    })
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Navigation Stack")
            
            SecondaryView()
        }
    }
}

struct SecondaryView:View {
    @StateObject var secondaryViewNavigationStack = NavigationStack()
    var body: some View{
        NavigationStackView(navigationStack: secondaryViewNavigationStack){
            ZStack{
                Color.red.ignoresSafeArea(.all)
                PushView(destination: SecondaryChildView(), label: {
                    Text("Push To Secondary Child")
                })
            }
        }
    }
}

struct SecondaryChildView:View {
    var body: some View{
        ZStack{
            Color.green.ignoresSafeArea(.all)
            VStack{
                Text("This is Child View")
                PopView{
                    Text("Pop View")
                }
            }
        }
    }
    
}

struct DoubleNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        DoubleNavigationView()
    }
}
