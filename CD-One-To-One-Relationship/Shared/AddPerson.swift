//
//  AddPerson.swift
//  CD-One-To-One-Relationship
//
//  Created by Haaris Iqubal on 1/5/22.
//

import SwiftUI

struct AddPerson: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var personName = ""
    @State private var personDoB = Date()
    @State private var personImage = UIImage()
    @State private var imagePicker = false
    
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
                TextField("Add Person Name",text: $personName)
                VStack{
                    DatePicker("Select Dob",selection: $personDoB,displayedComponents: .date)
                    Button(action: {
                        savePerson()
                        dismiss()
                    }, label: {
                        Text("Save")
                            .frame(minWidth:0, maxWidth: .infinity)
                    })
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle)
                        .tint(.green)
                }
            }
            .navigationTitle("Add Person")
        }
    }
    
    private func savePerson(){
        let newPerson = Person(context: viewContext)
        newPerson.id = UUID()
        newPerson.name = personName
        newPerson.profileImage = personImage.pngData()
        newPerson.dateOfBirth = personDoB
        do{
            try viewContext.save()
        }
        catch{
            print(error)
        }
    }
    
}

struct AddPerson_Previews: PreviewProvider {
    static var previews: some View {
        AddPerson()
    }
}
