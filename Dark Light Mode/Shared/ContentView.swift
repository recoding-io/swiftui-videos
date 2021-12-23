//
//  ContentView.swift
//  Shared
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isDarkMode") private var isDark = false
    @State private var isSheet = false
    var body: some View {
        NavigationView{
            VStack{
                List(0..<15,id:\.self){item in
                    NavigationLink(destination: Text("\(item) number"), label: {                    Text("\(item) number")})
                }
                
                Button(action:{isSheet.toggle()},label:{Label("Add",systemImage: "plus")})
                    .buttonStyle(.bordered)
                    .tint(.mint)
            }
            .sheet(isPresented: $isSheet){
                Text("Sheet View")
                    .preferredColorScheme(isDark ? .dark : .light)
            }
            .toolbar{
                ToolbarItem(placement:ToolbarItemPlacement.navigationBarTrailing){
                    Button(action:{isDark.toggle()},label:{
                        isDark ? Label("Dark",systemImage: "lightbulb.fill") : Label("Dark",systemImage: "lightbulb")
                    })
                }
            }
            .navigationTitle("Dark Mode")
        }
        .environment(\.colorScheme, isDark ? .dark : .light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
