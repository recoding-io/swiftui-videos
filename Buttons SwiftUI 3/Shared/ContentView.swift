//
//  ContentView.swift
//  Shared
//
//  Created by Haaris Iqubal on 9/5/21.
//

import SwiftUI
import CoreLocationUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ScrollView {
                VStack{
                    Button(action:{},label:{
                        Text("Bordered")
                            .frame(maxWidth:.infinity)
                    })
                        .tint(.green)
                        .buttonStyle(.bordered)
                    
                    Button(action:{},label:{
                        Text("Prominent")
                            .frame(maxWidth:.infinity)
                    })
                        .tint(.green)
                        .buttonStyle(.borderedProminent)
                    
                    Button(role:.destructive,action:{},label:{
                        Text("Delete")
                            .frame(maxWidth:.infinity)
                    })
                        .buttonStyle(.borderless)
                    Button(role:.cancel,action:{},label:{
                        Text("Cancel")
                            .frame(maxWidth:.infinity)
                    })
                        .tint(.yellow)
                        .buttonStyle(.borderless)
                    
                    Button(action: {}, label: {
                        Text("Small Size")
                            .frame(maxWidth:.infinity)
                    })
                        .tint(.blue)
                        .buttonStyle(.bordered)
                        .controlSize(.mini)
                    
                    Button("New Action"){}
                    .tint(.pink)
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.roundedRectangle(radius: 1))
                    .controlSize(.large)
                    
                    LocationButton(.sendCurrentLocation){}
                    .labelStyle(.titleAndIcon)
                    
                    
                    Button(action:{},label: {
                        Text("Gradient")
                            .bold()
                            .foregroundColor(.white)
                            .frame(width: 300,height: 35)
                            .background(LinearGradient(colors: [.blue,.pink], startPoint: .leading, endPoint: .trailing))
                            .clipShape(Capsule())
                    })
                    
                    Button(action:{},label: {
                        Text("Gradient")
                            .bold()
                            .frame(width: 300,height: 35)
                            .overlay(Capsule().stroke(LinearGradient(colors: [.blue,.pink], startPoint: .leading, endPoint: .trailing),lineWidth: 5))
                    })
                    
                    Button(action:{},label: {
                        Text("Radial")
                            .bold()
                            .foregroundColor(.white)
                            .frame(width:100,height:100)
                            .background(RadialGradient(colors: [.pink,.red,.yellow], center: .center, startRadius: 1, endRadius: 60))
                            .clipShape(Circle())
                    })
                    
                    
                    
                    
                }
                .padding()
                
                VStack{
                    Button(action:{},label: {
                        Text("Angular")
                            .bold()
                            .foregroundColor(.white)
                            .frame(width:100,height:100)
                            .background(AngularGradient(gradient: Gradient(colors: [.red,.yellow,.orange,.pink]), center: .center))
                            .clipShape(Circle())
                    })
                }
            }
            .toolbar{
                Menu("Options"){
                    Button("Btn 1"){}
                    Button("Delete",role:.destructive){}
                }
            }
            .navigationTitle("Buttons SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
