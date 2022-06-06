//
//  ContentView.swift
//  Shared
//
//  Created by Haaris Iqubal on 5/26/22.
//

import SwiftUI

struct ContentView: View {
    
    enum FocusedField{
        case fName, lName, email, pNumber, age
    }
    
    @State private var fName = ""
    @State private var lName = ""
    @State private var email = ""
    @State private var phoneNumber = ""
    @State private var age = ""

    @FocusState private var fieldFocus: FocusedField?
    
    var body: some View {
        NavigationView{
            Form{
                
                HStack{
                    Button(action: {
                        switchFieldRev(currentField: fieldFocus ?? .fName)
                    }, label: {
                        Text("Previous")
                            .frame(maxWidth: .infinity)
                    })
                    .buttonStyle(.bordered)
                    .tint(.blue)
                    
                    Button(action: {
                        switchField(currentField: fieldFocus ?? .fName)
                    }, label: {
                        Text("Next")
                            .frame(maxWidth: .infinity)
                    })
                    .buttonStyle(.bordered)
                    .tint(.mint)
                }
                
                Section("Name"){
                    TextField("First Name", text: $fName)
                        .focused($fieldFocus, equals: .fName)
                        .textContentType(.givenName)
                        .submitLabel(.next)
                    TextField("Last Name", text: $lName)
                        .focused($fieldFocus, equals: .lName)
                        .textContentType(.familyName)
                        .submitLabel(.next)

                }
                Section("Contact Details"){
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .focused($fieldFocus, equals: .email)
                        .textContentType(.emailAddress)
                        .submitLabel(.next)

                    TextField("Phone Number", text: $phoneNumber)
                        .keyboardType(.numberPad)
                        .focused($fieldFocus, equals: .pNumber)
                        .textContentType(.telephoneNumber)

                }
                Section("Personal Details"){
                    TextField("Age", text: $age)
                        .keyboardType(.numberPad)
                        .textFieldStyle(.roundedBorder)
                        .focused($fieldFocus, equals: .age)
                        .textContentType(.dateTime)
                }
                
                Button(action: {}, label: {
                    Text("Submit")
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(.borderedProminent)
                .tint(.green)
            }
            .onSubmit {
                switchField(currentField: fieldFocus ?? .fName)
            }
            .navigationTitle("Contact Us Form")
        }

    }
    
    func switchField(currentField: FocusedField){
        switch currentField {
        case .fName:
            fieldFocus = .lName
        case .lName:
            fieldFocus = .email
        case .email:
            fieldFocus = .pNumber
        case .pNumber:
            fieldFocus = .age
        case .age:
            fieldFocus = .fName
        }
    }
    
    func switchFieldRev(currentField: FocusedField){
        switch currentField {
        case .fName:
            fieldFocus = .age
        case .lName:
            fieldFocus = .fName
        case .email:
            fieldFocus = .lName
        case .pNumber:
            fieldFocus = .email
        case .age:
            fieldFocus = .pNumber
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
