//
//  ContentView.swift
//  Core-Data-To-Do-App
//
//  Created by Haaris Iqubal on 5/14/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Item.entity(), sortDescriptors: [NSSortDescriptor(key:"title",ascending: true)])var items: FetchedResults<Item>
    
    @State private var taskField = ""
    
    
    var body: some View {
        VStack{
            List{
                ForEach(items){item in
                    Text(item.title ?? "Untitled")
                        .font(.largeTitle)
                }
                .onDelete(perform: deleteItem)
            }
            .listStyle(SidebarListStyle())
            .overlay(tastTextField, alignment: .bottom)
            .navigationTitle(Text("Core Data"))
        }
    }
    
    var tastTextField: some View{
        HStack{
            TextField("Add Item", text: $taskField)
            Spacer()
            Button(action: {
                addItem()
            }, label: {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(taskField.isEmpty ? .gray : .blue)
                    .font(.largeTitle)
            })
        }
        .padding(5)
        .padding(.bottom,5)
        .padding(.leading,5)
        .padding(.trailing,5)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.5)).padding(.bottom,5).padding(.leading,5).padding(.trailing,5))
    }
    
    func addItem(){
        let item = Item(context: viewContext)
        item.title = taskField
        item.id = UUID()
        do{
            try viewContext.save()
            taskField = ""
        }catch{
            print(error.localizedDescription)
        }
    }
    func deleteItem(at offset:IndexSet){
        for index in offset{
            let itemToBeDeleted = items[index]
            viewContext.delete(itemToBeDeleted)
            do{
                try viewContext.save()
            }
            catch{
                print(error.localizedDescription)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
