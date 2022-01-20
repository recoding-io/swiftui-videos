//
//  AddEmployee.swift
//  CD_One_To_Many_Relationship
//
//  Created by Haaris Iqubal on 1/8/22.
//

import SwiftUI

struct AddEmployee: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var personName = ""
    @State private var personImage = UIImage()
    @State private var personAge = ""
    @State private var imagePicker = false
    @State private var selectedDepartment = Department()
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Department.name, ascending: true)]) private var departments:FetchedResults<Department>
    
    var body: some View {
        NavigationView{
            Form{
                VStack{
                    Image(uiImage: personImage)
                        .resizable()
                        .scaledToFit()
                        .edgesIgnoringSafeArea(.all)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .overlay(Circle().stroke(Color.gray,lineWidth: 5))
                    Button(action: {
                        imagePicker.toggle()
                    }, label: {
                        Text("Add Image")
                    })
                        .sheet(isPresented: $imagePicker){
                            ImagePickerView(selectedImage: $personImage)
                        }
                }
                TextField("Add Person Name", text: $personName)
                TextField("Add Person Age", text: $personAge).keyboardType(.decimalPad)
                
                // Implement Department Picker
                
                Picker("Select Employee Department", selection: $selectedDepartment){
                    ForEach(departments,id: \.self){
                        Text($0.name ?? "")
                    }
                }
                
                Button(action: {
                    addEmployee()
                    dismiss()
                }, label: {
                    Text("Save Person")
                        .frame(minWidth:0, maxWidth: .infinity)
                })
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.roundedRectangle)
                    .tint(.blue)
            }
            .navigationTitle("Add Person")
        }
    }
    
    private func addEmployee(){
        let newEmployee = Employee(context: viewContext)
        newEmployee.id = UUID()
        newEmployee.name = personName
        newEmployee.age = Int16(personAge)!
        newEmployee.profileImage = personImage.pngData()
        newEmployee.employeeToDepartment = selectedDepartment
        do{
            try viewContext.save()
        }
        catch{
            print("Error while saving Employee Data \(error.localizedDescription)")
        }
    }
    
}

struct AddEmployee_Previews: PreviewProvider {
    static var previews: some View {
        AddEmployee()
    }
}
