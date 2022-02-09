//
//  ContentView.swift
//  Shared
//
//  Created by Haaris Iqubal on 2/3/22.
//

import SwiftUI
import CoreData

extension Tag{
    public var itemsArray:[Item]{
        let set = tagToItem as? Set<Item> ?? []
        return set.sorted{
            $0.timestamp! < $1.timestamp!
        }
    }
}

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Tag.title, ascending: true)], animation: .default) private var tags: FetchedResults<Tag>
    
    @State private var addTag = false
    @State private var addItem = false
    var body: some View {
        NavigationView {
            List {
                Section("Tags"){
                    ForEach(tags) { tag in
                        NavigationLink(destination: {
                            List(tag.itemsArray){itemInTag in
                                Text(itemInTag.title ?? "")
                            }
                        }, label: {
                            HStack{
                                Circle().fill(Color(tag.color ?? "TagColorRed")).frame(width:30, height: 30)
                                Text(tag.title ?? "")
                                Spacer()
                                Text("\(tag.tagToItem?.count ?? 0)")
                            }
                            
                        })
                    }
                    .onDelete(perform: deleteTags)
                    
                    }
                Section("Items"){
                    ForEach(items){item in
                        Text(item.title ?? "")
                    }.onDelete(perform: deleteItems)
                }
            }
            .navigationTitle("Many to Many")
            .sheet(isPresented: $addItem){
                AddItemView()
            }
            .sheet(isPresented: $addTag){
                AddTagView()
            }
            .toolbar {

                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack{
                        Button(action: {
                            addItem.toggle()
                        }, label: {
                            Label("Add", systemImage: "plus")
                        })
                        Button(action: {
                            addTag.toggle()
                        }, label: {
                            Label("Tag",systemImage: "tag.fill")
                        })
                    }
                }
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteTags(offsets: IndexSet){
        for tag in offsets{
            let tagToDelete = tags[tag]
            do{
                viewContext.delete(tagToDelete)
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
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
