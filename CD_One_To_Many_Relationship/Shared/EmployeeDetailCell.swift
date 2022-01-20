//
//  EmployeeDetailCell.swift
//  CD_One_To_Many_Relationship
//
//  Created by Haaris Iqubal on 1/8/22.
//

import SwiftUI

struct EmployeeDetailCell: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var employee:Employee
    
    var body: some View {
        VStack{
            HStack{
                if (employee.profileImage != nil){
                    Image(uiImage: UIImage(data: employee.profileImage!)!)
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 60, height: 60)
                }
                VStack(alignment: .leading){
                    Text("Name : " + (employee.name ?? "")).font(.title2)
                    Text("Age : \(employee.age)").foregroundColor(.gray)
                }
            }
        }
        .swipeActions(edge:.trailing){
            Button(role:.destructive,action: {
                deleteEmployee()
            },label:{
                Label("Delete Employee",systemImage: "trash")
            })
        }
    }
    
    private func deleteEmployee(){
        let employeeToDelete = employee
        do{
            viewContext.delete(employeeToDelete)
            try viewContext.save()
        }
        catch{
            print("Error while deleting employee \(error.localizedDescription)")
        }
    }
    
}

