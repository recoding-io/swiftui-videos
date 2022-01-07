//
//  ContentView.swift
//  Shared
//
//  Created by Haaris Iqubal on 1/5/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Person.dateOfBirth, ascending: true)],animation:.default) private var fetchedPerson:FetchedResults<Person>

    @State private var addPerson = false
    @State private var addLicense = false
    var body: some View {
        NavigationView {
            List {
                ForEach(fetchedPerson){ person in
                    VStack{
                        HStack{
                            if(person.profileImage != nil){
                                Image(uiImage: UIImage(data: person.profileImage!)!)
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .scaledToFit()
                                    .ignoresSafeArea(.all)
                                    .clipShape(Circle())
                                    .shadow(radius: 10)
                            }
                            VStack(alignment:.leading){
                                Text(person.name ?? "")
                                    .font(.title2)
                                
                                if (person.personToLicense != nil){
                                    Text("State: \(person.personToLicense!.state!)")
                                    Text("Valid : \(person.personToLicense!.validDate!.formatted(.dateTime.year().month().day()))")
                                        .foregroundColor(.gray)
                                }
                                if (person.dateOfBirth != nil){
                                    Text("Birth : \(person.dateOfBirth!.formatted(.dateTime.year().month().day()))")
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                }
                .onDelete(perform: deletePerson)
            }
            .navigationTitle("Transport Dept.")
            .sheet(isPresented: $addPerson){
                AddPerson()
            }
            .sheet(isPresented: $addLicense){
                AddLicense()
            }
            .toolbar {
                ToolbarItemGroup(placement:.navigationBarTrailing){
                    Button(action:{
                        addPerson.toggle()
                    },label:{
                        Label("Add Person",systemImage: "plus")
                    })
                    Button(action:{
                        addLicense.toggle()
                    },label:{
                        Label("Add License",systemImage: "creditcard")
                    })
                }
            }
        }
    }
    
    private func deletePerson(at offsets: IndexSet){
        withAnimation{
            for index in offsets{
                let person = fetchedPerson[index]
                do{
                    viewContext.delete(person)
                    try viewContext.save()
                }
                catch{
                    print(error)
                }
            }
        }
    }

}

