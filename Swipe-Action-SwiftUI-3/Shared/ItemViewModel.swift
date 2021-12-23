//
//  ItemViewModel.swift
//  Swipe-Action-SwiftUI-3
//
//  Created by Haaris Iqubal on 12/17/21.
//

import Foundation

class ItemViewModel:ObservableObject{
    @Published var items:[Item] = []
    
    func getItem(){
        items = Item.ItemsData
    }
    
    func move(fromOffsets:IndexSet,toOffset:Int){
        items.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
    
    func delete(atOffset:IndexSet){
        items.remove(atOffsets: atOffset)
    }
    
    func remove(item:Item){
        if let index = items.firstIndex(of: item){
            items.remove(at: index)
        }else{return}
    }
    
    func isFavorite(item:Item){
        if let index = items.firstIndex(of: item){
            items[index].isFavorite.toggle()
            if items[index].isArchive{
                items[index].isArchive.toggle()
            }
        }
        else{return}
    }
    
    func isArchive(item:Item){
        if let index = items.firstIndex(of: item){
            items[index].isArchive.toggle()
            if items[index].isFavorite{
                items[index].isFavorite.toggle()
            }
        }
        else{return}
    }
}
