//
//  AddDepartment.swift
//  CD_One_To_Many_Relationship
//
//  Created by Haaris Iqubal on 1/8/22.
//

import SwiftUI

struct AddDepartment: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var departmentName = ""
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Enter Department Name",text: $departmentName)
                Button(action: {
                    saveDepartment()
                    dismiss()
                }, label: {
                    Text("Save Department")
                        .frame(minWidth:0, maxWidth: .infinity)
                })
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.roundedRectangle)
                    .tint(.blue)
            }
            .navigationTitle("Add Department")
        }
    }
    
    private func saveDepartment(){
        let newDepartment = Department(context: viewContext)
        newDepartment.id = UUID()
        newDepartment.name = departmentName
        
        do{
            try viewContext.save()
        }
        catch{
            print("Error saving Depart value \(error.localizedDescription)")
        }
    }
}

struct AddDepartment_Previews: PreviewProvider {
    static var previews: some View {
        AddDepartment()
    }
}
