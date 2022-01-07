//
//  ContentView.swift
//  Shared
//
//  Created by Haaris Iqubal on 12/29/21.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var taskListVM:TaskListViewModel
    
    @FetchRequest(entity: TaskList.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)]) var fetchedTaskList:FetchedResults<TaskList>
    
    @State private var addView = false
    
    var body: some View {
        NavigationView{
            List{
                Section("Favorite"){
                    ForEach(fetchedTaskList.filter{$0.isFavorite == true}){item in
                        TaskListCell(taskListItem: item)
                    }
                }
                Section("Tasks"){
                    ForEach(fetchedTaskList.filter{$0.isFavorite == false}){item in
                        TaskListCell(taskListItem: item)
                    }
                }
                
            }
            .sheet(isPresented: $addView){
                AddListView(addView: $addView)
            }
            .toolbar{
                Button(action: {
                    taskListVM.taskListTitle = ""
                    taskListVM.taskListItem = nil
                    addView.toggle()
                }, label: {
                    Label("Add Item",systemImage: "plus")
                })
            }
            .navigationTitle("CD CRUD MVVM")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
