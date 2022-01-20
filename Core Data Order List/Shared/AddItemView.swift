//
//  AddItemViews.swift
//  Core Data Order List
//
//  Created by Haaris Iqubal on 1/10/22.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var itemTitle = ""
    
    @FetchRequest(sortDescriptors:[]) private var items:FetchedResults<Item>
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Add Title",text: $itemTitle)
                Button(action: {
                    saveItem()
                    dismiss()
                }, label: {
                    Text("Save Item").frame(minWidth: 0,maxWidth: .infinity)
                })
            }
            .navigationTitle("Add Item")
        }
    }
    
    private func saveItem(){
        let newItem = Item(context: viewContext)
        newItem.title = itemTitle
        newItem.order = (items.last?.order ?? 0) + 1
        newItem.timestamp = Date()
        do{
            try viewContext.save()
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
