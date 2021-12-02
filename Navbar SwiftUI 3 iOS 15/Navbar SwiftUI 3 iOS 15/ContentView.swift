//
//  ContentView.swift
//  Navbar SwiftUI 3 iOS 15
//
//  Created by Haaris Iqubal on 11/29/21.
//

import SwiftUI

struct listData:Identifiable{
    let id = UUID()
    var name:String
}

struct dataForList{
    static let data = [
        listData(name: "First"),
        listData(name: "Second"),
        listData(name: "Third"),
        listData(name: "Fourth"),
        listData(name: "Fifth"),
        listData(name: "Sixth"),
        listData(name: "Seventh"),
        listData(name: "Eighth"),
        listData(name: "Ninth"),
        listData(name: "Tenth"),
        listData(name: "First"),
        listData(name: "Second"),
        listData(name: "Third"),
        listData(name: "Fourth"),
        listData(name: "Fifth"),
        listData(name: "Sixth"),
        listData(name: "Seventh"),
        listData(name: "Eighth"),
        listData(name: "Ninth"),
        listData(name: "Tenth")
    ]
}

struct ContentView: View {
    
//    init(){
//        let appearance = UINavigationBarAppearance()
//        appearance.configureWithOpaqueBackground()
//        appearance.backgroundColor = .systemCyan
//        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//        UINavigationBar.appearance().standardAppearance = appearance
//        UINavigationBar.appearance().compactAppearance = appearance
//        UINavigationBar.appearance().scrollEdgeAppearance = appearance
//        UINavigationBar.appearance().tintColor = .white
//    }
    
    var body: some View {
        NavigationView{
            List(dataForList.data,id:\.id){item in
                NavigationLink(destination: Text(item.name)
                                .navigationBarTitle("\(item.name)")
                                .toolbar{
                    ToolbarItemGroup(placement:ToolbarItemPlacement.navigationBarTrailing){
                        Button(action:{},label:{
                            Label("Send",systemImage: "paperplane.fill")
                        })

                        Menu{
                            Button(role: .none, action: {}, label: {
                                Label("Edit",systemImage: "pencil")
                            })
                            Button(role:.destructive,action: {},label: {
                                Label("Delete",systemImage: "trash.fill")
                            })
                        }label: {
                            Label("Option",systemImage: "ellipsis.circle")
                        }
                    }
                }, label: {
                    ZStack{
                        Text(item.name)
                    }
                })
                .listRowBackground(Color.blue)
            }
            .navigationTitle("Navigation iOS 15")
                .navigationBarTitleDisplayMode(.large)
                .toolbar{
                    ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading){
                        Button(action: {}, label: {
                            Label("Refresh",systemImage: "arrow.clockwise")
                        })
                    }
                        
                        ToolbarItemGroup(placement:ToolbarItemPlacement.navigationBarTrailing){
                            Button(action:{},label:{
                                Label("Send",systemImage: "paperplane.fill")
                            })
                            
                            Menu{
                                Button(role: .none, action: {}, label: {
                                    Label("Edit",systemImage: "pencil")
                                })
                                Button(role:.destructive,action: {},label: {
                                    Label("Delete",systemImage: "trash.fill")
                                })
                            }label: {
                                Label("Option",systemImage: "ellipsis.circle")
                            }
                        }
                }
                .navigationBarModifier(backgroundColor: UIColor.blue, foregroundColor:UIColor.yellow, largeTextAttributesColor: UIColor.yellow, tintColor: UIColor.yellow,hideseperator: false)
//                .onAppear{
//                    let appearance = UINavigationBarAppearance()
//                    appearance.configureWithOpaqueBackground()
//                    appearance.backgroundColor = .systemCyan
//                    appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//                    appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//                    UINavigationBar.appearance().standardAppearance = appearance
//                    UINavigationBar.appearance().compactAppearance = appearance
//                    UINavigationBar.appearance().scrollEdgeAppearance = appearance
//                    UINavigationBar.appearance().tintColor = .white
//                }
        }
    }
}

struct NavigationBarCustomModifier:ViewModifier{
    
    init(backgroundColor: UIColor, foregroundColor:UIColor, largeTextAttributesColor: UIColor, tintColor: UIColor? = nil,hideseperator: Bool = false){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = backgroundColor
        appearance.titleTextAttributes = [.foregroundColor: foregroundColor]
        appearance.largeTitleTextAttributes = [.foregroundColor: largeTextAttributesColor]
        if hideseperator {
            UINavigationBar.appearance().tintColor = .clear
        }
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = .white
        
        if let tintColor = tintColor {
            UINavigationBar.appearance().tintColor = tintColor
        }
    }
    
    func body(content: Content) -> some View {
        content
    }
}

extension View{
    func navigationBarModifier(backgroundColor: UIColor, foregroundColor:UIColor, largeTextAttributesColor: UIColor, tintColor: UIColor? = nil,hideseperator: Bool = false)-> some View{
        self.modifier(NavigationBarCustomModifier(backgroundColor: backgroundColor, foregroundColor: foregroundColor, largeTextAttributesColor: largeTextAttributesColor, tintColor: tintColor, hideseperator: hideseperator))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
