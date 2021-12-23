//
//  ContentView.swift
//  Shared
//
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var itemVM = ItemViewModel()
    
    var body: some View {
        NavigationView{
            List{
                Section("Favorite"){
                    ForEach(itemVM.items.filter{$0.isFavorite == true}.filter{$0.isArchive == false},id:\.id){vehicle in
                        VehicleCellItem(vehicle: vehicle)
                    }
                    .onMove(perform: itemVM.move)
                    .onDelete(perform: itemVM.delete)
                }
                Section("Transport"){
                    ForEach(itemVM.items.filter{$0.isFavorite == false}.filter{$0.isArchive == false},id:\.id){vehicle in
                        VehicleCellItem(vehicle: vehicle)
                    }
                    .onMove(perform: itemVM.move)
                    .onDelete(perform: itemVM.delete)
                }
                Section("Archive"){
                    ForEach(itemVM.items.filter{$0.isFavorite == false}.filter{$0.isArchive == true},id:\.id){vehicle in
                        VehicleCellItem(vehicle: vehicle)
                    }
                    .onMove(perform: itemVM.move)
                    .onDelete(perform: itemVM.delete)
                }
                
            }
            .toolbar{
                EditButton()
            }
            .environmentObject(itemVM)
            .task {
                itemVM.getItem()
            }
            .navigationTitle("Transportation")
        }
    }
}

struct VehicleCellItem:View{
    @State var vehicle:Item
    @EnvironmentObject var itemVM:ItemViewModel
    var body:some View{
        HStack{
            Image(systemName: vehicle.icon)
                .foregroundColor(vehicle.color)
                .frame(width: 30)
            Text(vehicle.name)
        }
        .listRowSeparatorTint(vehicle.color)
        .swipeActions(edge: .trailing, allowsFullSwipe: false){
            Button(role:.destructive,action: {
                withAnimation{
                    itemVM.remove(item: vehicle)
                }
            },label: {
                Label("Delete",systemImage: "trash")
            })
            
            Button(action: {
                withAnimation{
                    itemVM.isArchive(item: vehicle)
                }
            }, label: {
                Label("Archive",systemImage: "archivebox.fill")
            })
                .tint(.purple)
        }
        .swipeActions(edge: .leading, allowsFullSwipe: true){
            Button(action:{
                withAnimation{
                    itemVM.isFavorite(item: vehicle)
                }
            },label: {
                Label("Favorite",systemImage: !vehicle.isFavorite ? "star.fill" : "star.slash")
            })
                .tint(.yellow)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
