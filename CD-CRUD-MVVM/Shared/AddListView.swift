//
//  AddListView.swift
//  CD-CRUD-MVVM
//
//  Created by Haaris Iqubal on 12/29/21.
//

import SwiftUI

struct AddListView: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var taskListVM:TaskListViewModel
    @Binding var addView:Bool
    
    var body: some View {
        NavigationView{
            Form{
                VStack{
                    TextField("Enter Title", text: $taskListVM.taskListTitle)
                    Button(action: {
                        taskListVM.createTask(context: viewContext)
                        addView.toggle()
                    }, label: {
                        if taskListVM.taskListItem == nil {
                            Text("Add Item")
                                .frame(minWidth: 0,maxWidth: .infinity)
                        }
                        else{
                            Text("Edit Item")
                                .frame(minWidth: 0,maxWidth: .infinity)
                        }
                    })
                        .tint(.yellow)
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle)
                }
            }
            .navigationTitle(taskListVM.taskListItem == nil ? "Add Item" : "Edit")
        }
    }
}

