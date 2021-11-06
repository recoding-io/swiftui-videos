//
//  ContentView.swift
//  Shared
//
//  Created by Haaris Iqubal on 11/5/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentSubviewIndex = 0
    @State private var showingSubview = false
    
    var body: some View {
        NavigationView{
            List{
                NavigationLink(destination: Text("Dashboard"),label: {
                    Label("Dashboard", systemImage: "square.grid.2x2.fill")
                })
            }
            StackNavigationView(currentSubviewIndex: self.$currentSubviewIndex, showingSubview: self.$showingSubview, subviewByIndex: {index in self.subView(forIndex: index)}){
                VStack{
                    Button(action: {
                        self.showSubview(withIndex: 0)
                    }){
                        Text("View 1")
                    }
                    Button(action: {
                        self.showSubview(withIndex: 1)
                    }){
                        Text("View 2")
                    }
                }
            }
        }
        .toolbar{
            ToolbarItem{
                Button(action: {},label: {
                    Label("Add",systemImage: "plus")
                })
            }
        }
        .frame(minWidth: 900,minHeight: 600)
    }
    
    
    private func subView(forIndex index: Int) -> AnyView {
        switch index {
        case 0: return AnyView(Text("First View").frame(maxWidth:.infinity,maxHeight: .infinity).background(Color.green))
        case 1: return AnyView(Text("Second View").frame(maxWidth:.infinity,maxHeight: .infinity).background(Color.red))
        default: return AnyView(Text("Default View").background(Color.blue))
        }
    }
    
    private func showSubview(withIndex index:Int){
        withAnimation(.easeIn(duration: 0.3)){
            currentSubviewIndex = index
            showingSubview = true
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
