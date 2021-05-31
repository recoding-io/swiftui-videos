//
//  ContentView.swift
//  GridApp
//
//  Created by Haaris Iqubal on 5/31/21.
//

import SwiftUI

struct ContentView: View {
    
    let fixed: [GridItem] = [.init(.fixed(100)),.init(.fixed(100)),.init(.fixed(100))]
    
    let flexible: [GridItem] = [.init(.flexible(minimum: 50)),.init(.flexible(minimum: 50)),.init(.flexible(minimum: 100, maximum: 150))]
    
    let adaptive: [GridItem] = Array(repeating: .init(.adaptive(minimum: 100, maximum: 400)), count: 3)
    let dataGrid: [GridItem] = Array(repeating: .init(.flexible(minimum: 100)),count: 4)
    let data = DataDemo.data
    var body: some View {
        ScrollView{
            LazyVGrid(columns: fixed,spacing: 20,pinnedViews: [.sectionHeaders]){
                Section(header:Text("Fixed").font(.title)){
                    ForEach(0..<9){_ in
                        Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
                            .cornerRadius(20)
                            .frame(height: 50)
                    }
                }
            }
            
            LazyVGrid(columns: flexible){
                Section(header:Text("Flexible").font(.title)){
                    ForEach(0..<9){_ in
                        Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
                            .cornerRadius(20)
                            .frame(height: 50)
                    }
                }
            }
            
            LazyVGrid(columns: adaptive, spacing:10,pinnedViews: [.sectionHeaders]){
                Section(header: Text("Adaptive").font(.title)){
                    ForEach(0..<9){_ in
                        Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
                            .cornerRadius(20)
                            .frame(height: 50)
                    }
                }
            }
            
            ScrollView(.horizontal){
                HStack{
                    Section(header:Text("Horizontal Fixed").rotationEffect(Angle(degrees: -90))){
                        LazyHGrid(rows: fixed){
                            ForEach(0..<9){_ in
                                Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
                                    .cornerRadius(20)
                                    .frame(width: 100)
                            }
                        }
                    }
                    Section(header:Text("Horizontal Flexible").rotationEffect(Angle(degrees: -90))){
                        LazyHGrid(rows: flexible){
                            ForEach(0..<9){_ in
                                Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
                                    .cornerRadius(20)
                                    .frame(width: 100)
                            }
                        }
                    }
                    Section(header:Text("Horizontal Adaptive").rotationEffect(Angle(degrees: -90))){
                        LazyHGrid(rows: adaptive){
                            ForEach(0..<9){_ in
                                Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
                                    .cornerRadius(20)
                                    .frame(width: 100)
                            }
                        }
                    }
                }
            }
            
            LazyVGrid(columns: dataGrid){
                Section(header:Text("Data Table").font(.title)){
                    Text("Id")
                    Text("Name")
                    Text("Score")
                    Text("Date")
                    ForEach(data){item in
                        Text("\(item.id)")
                        Text(item.name)
                        Text("\(item.score)")
                        Text(item.date,style: .date)
                    }
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
