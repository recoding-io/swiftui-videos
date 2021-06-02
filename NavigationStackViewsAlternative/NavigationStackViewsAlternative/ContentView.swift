//
//  ContentView.swift
//  NavigationStackViewsAlternative
//
//  Created by Haaris Iqubal on 6/2/21.
//

import SwiftUI
import NavigationStack

struct ContentView: View {
    @State private var isActive = false
    var body: some View {
        NavigationStackView {
            ZStack{
                Color.yellow.ignoresSafeArea(.all)
                VStack{
                    PushView(destination: ChildView(),isActive: $isActive, label: {
                        Text("Push Child View")
                    })
                    Button(action: {
                        self.isActive.toggle()
                    }, label: {
                        Text("Push View")
                    })                    
                }
            }
        }
    }
}

struct ChildView:View{
    var body: some View{
        ZStack{
            Color.red.ignoresSafeArea(.all)
            VStack{
                Text("This is Child View")
                PopView{
                    Text("Pop to main")
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
