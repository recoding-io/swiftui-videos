//
//  NavigationInjectionView.swift
//  NavigationStackViewsAlternative
//
//  Created by Haaris Iqubal on 6/2/21.
//

import SwiftUI
import NavigationStack

struct NavigationInjectionView: View {
    @StateObject var navigationStack = NavigationStack()
    var body: some View {
        NavigationStackView(navigationStack: navigationStack){
            HomeScreen(router: Router(navStack: navigationStack))
        }
    }
}

struct Screen1:View {
    var body: some View{
        VStack{
            Text("Screen 1")
            PopView{
                Text("PopView")
            }
            
        }
    }
}


struct Screen2:View {
    var body: some View{
        VStack{
            Text("Screen 2")
            PopView{
                Text("PopView")
            }            
        }
    }
}

class Router {
    private let navStack:NavigationStack
    init(navStack:NavigationStack) {
        self.navStack = navStack
    }
    func toScreen1() {
        self.navStack.push(Screen1())
    }
    func toScreen2() {
        self.navStack.push(Screen2())
    }
}

struct HomeScreen:View {
    let router:Router
    
    var body: some View{
        VStack{
            Text("Home")
            Button(action: {
                self.router.toScreen1()
            }, label: {
                Text("Push Screen 1")
            })
            Button(action: {
                self.router.toScreen2()
            }, label: {
                Text("Push Screen 2")
            })
        }
    }
}

struct NavigationInjectionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationInjectionView()
    }
}
