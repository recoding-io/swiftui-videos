//
//  ContentView.swift
//  Shared
//
//  Created by Haaris Iqubal on 2/18/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var themeManager:ThemeManager
    
    @State private var isSheet = false
    
    var body: some View {
        NavigationView{
            List{
                NavigationLink(destination: {
                    ZStack{
                        themeManager.selectedTheme.secondaryColor.ignoresSafeArea(.all)
                        
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                            .padding()

                    }
                        .navigationTitle("Navigation Link")
                }, label: {
                    Text("Open Navigation Link")
                })
                
                ForEach(0..<10){item in
                    Text("Item \(item)")
                }
            }
            .listBackgroundModifier(backgroundColor: themeManager.selectedTheme.secondaryColor)
            .navigationBarModifier(backgroundColor: UIColor(themeManager.selectedTheme.primaryColor), foregroundColor: UIColor(themeManager.selectedTheme.secondaryColor), largeTextAttributesColor: UIColor(themeManager.selectedTheme.labelColor))
            .toolbar{
                Button(action: {
                    isSheet.toggle()
                }, label: {
                    Label("Settings", systemImage: "gear")
                })
            }
            .navigationTitle("Theme Changer")
            .sheet(isPresented: $isSheet){
                SheetItemView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
