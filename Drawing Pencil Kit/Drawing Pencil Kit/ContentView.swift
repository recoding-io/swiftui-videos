//
//  ContentView.swift
//  Drawing Pencil Kit
//
//  Created by Haaris Iqubal on 5/7/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: Drawing.entity(), sortDescriptors: []) var drawings: FetchedResults<Drawing>
    
    @State private var showSheet = false

    var body: some View {
        NavigationView{
            VStack{
                List {
                    ForEach(drawings){drawing in
                        NavigationLink(destination: DrawingView(id: drawing.id, data: drawing.canvasData, title: drawing.title), label: {
                            Text(drawing.title ?? "Untitled")
                        })
                    }
                    .onDelete(perform: deleteItem)
                    
                    Button(action: {
                        self.showSheet.toggle()
                    }, label: {
                        HStack{
                            Image(systemName: "plus")
                            Text("Add Canvas")
                        }
                    })
                    .foregroundColor(.blue)
                    .sheet(isPresented: $showSheet, content: {
                        AddNewCanvasView().environment(\.managedObjectContext, viewContext)
                    })
                }
                .navigationTitle(Text("Drawing"))
                .toolbar {
                    EditButton()
                }
                
                
            }
            VStack{
                Image(systemName: "scribble.variable")
                    .font(.largeTitle)
                Text("No canvas has been selected")
                    .font(.title)
            }
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
        
    }
    
    func deleteItem(at offset: IndexSet) {
        for index in offset{
            let itemToDelete = drawings[index]
            viewContext.delete(itemToDelete)
            do{
                try viewContext.save()
            }
            catch{
                print(error)
            }
        }
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
