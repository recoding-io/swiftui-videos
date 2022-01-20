//
//  ContentView.swift
//  Shared
//
//  Created by Haaris Iqubal on 1/8/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Department.name, ascending: true)]) private var departments:FetchedResults<Department>
    
    @State private var addDepartment = false
    @State private var addPerson = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(departments){department in
                    NavigationLink(destination: {
                        List{
                            ForEach(department.employee){employee in
                                EmployeeDetailCell(employee: employee)
                            }
                        }
                        .navigationTitle("Person in : " + (department.name!))
                    }, label: {
                        Text(department.name ?? "")
                    })
                }
                .onDelete(perform: deleteDepartment)
            }
            .navigationTitle("Apple's")
            .sheet(isPresented: $addDepartment){
                AddDepartment()
            }
            .sheet(isPresented: $addPerson){
                AddEmployee()
            }
            .toolbar {
                ToolbarItemGroup(placement:.navigationBarTrailing){
                    Button(action: {
                        addDepartment.toggle()
                    }, label: {
                        Label("Add Department",systemImage: "building")
                    })
                    Button(action: {
                        addPerson.toggle()
                    }, label: {
                        Label("Add Person", systemImage: "person.fill")
                    })
                }
            }
        }
    }
    
    
    private func deleteDepartment(at offset:IndexSet){
        for index in offset{
            let departmentToDelete = departments[index]
            do{
                viewContext.delete(departmentToDelete)
                try viewContext.save()
            }catch{
                print("Error while deleting Department \(error.localizedDescription)")
            }
        }
    }

}
