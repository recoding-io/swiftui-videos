//
//  TaskListView.swift
//  CD-CRUD-MVVM
//
//  Created by Haaris Iqubal on 12/29/21.
//

import Foundation
import Combine
import CoreData

class TaskListViewModel:ObservableObject{
    @Published var taskListTitle = ""
    @Published var taskListItem:TaskList!
    
    func createTask(context:NSManagedObjectContext){
        if taskListItem == nil {
            let task = TaskList(context: context)
            task.id = UUID()
            task.title = taskListTitle
            task.isDone = false
            task.isFavorite = false
            task.date = Date()
        }
        else{
            taskListItem.title = taskListTitle
        }
        
        save(context: context)
        taskListTitle = ""
    }
    
    func editList(task:TaskList){
        taskListItem = task
    }
    
    func delete(task:TaskList, context:NSManagedObjectContext){
        context.delete(task)
        save(context: context)
    }
    
    func isFavorite(task:TaskList, context:NSManagedObjectContext){
        task.isFavorite.toggle()
        save(context: context)
    }
    
    func isDone(task:TaskList, context:NSManagedObjectContext){
        task.isDone.toggle()
        save(context: context)
    }
    
    
    func save(context:NSManagedObjectContext){
        do{
            try context.save()
        }
        catch{
            print(error)
        }
    }
    
}
