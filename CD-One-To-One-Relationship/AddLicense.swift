//
//  AddLicense.swift
//  CD-One-To-One-Relationship
//
//  Created by Haaris Iqubal on 1/5/22.
//

import SwiftUI

struct AddLicense: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedState = "California"
    @State private var selectedPerson:Person = Person()
    @State private var dateValid = Date()
    
    var states = ["California", "San Fransisco", "New York"]
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Person.dateOfBirth, ascending: true)],animation:.default) private var fetchedPerson:FetchedResults<Person>
    
    var body: some View {
        NavigationView{
            Form{
                Picker("Select state",selection: $selectedState){
                    ForEach(states,id: \.self){
                        Text($0)
                    }
                }
                .pickerStyle(.wheel)
                
                Picker("Select Person",selection: $selectedPerson){
                    ForEach(fetchedPerson,id:\.self){
                        Text($0.name ?? "")
                    }
                }
                DatePicker("Select valid date up to", selection: $dateValid,displayedComponents: .date)
                
                Button(action: {
                    saveLicense()
                    dismiss()
                }, label: {
                    Text("Save License")
                        .frame(minWidth: 0,maxWidth: .infinity)
                })
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.roundedRectangle)
                    .tint(.green)
            }
            .navigationTitle("Add License")
        }
    }
    
    private func saveLicense(){
        let newLicense = License(context: viewContext)
        newLicense.id = UUID()
        newLicense.validDate = dateValid
        newLicense.state = selectedState
        newLicense.licenseToPerson = selectedPerson
        
        do{
            try viewContext.save()
        }
        catch{
            print(error)
        }
    }
}

