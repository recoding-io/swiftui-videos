//
//  PrimaryView.swift
//  PrimaryView
//
//  Created by Haaris Iqubal on 10/12/21.
//

import SwiftUI

struct dataSample: Identifiable,Hashable{
    var id = UUID()
    let name:String
    let icon:String
    let detail:String
}

struct dataExample{
    static var example = [
    dataSample(name: "Data 1", icon: "info", detail: "This is details 1"),
    dataSample(name: "Data 2", icon: "pencil", detail: "This is details 2"),
    dataSample(name: "Car", icon: "car", detail: "This is details car"),
    dataSample(name: "Book", icon: "book", detail: "This is details book"),
    dataSample(name: "Document", icon: "doc", detail: "This is contains documents"),
    dataSample(name: "Newspaper", icon: "newspaper", detail: "This is newspaper link item"),
    dataSample(name: "Data 3", icon: "shift", detail: "This is details data 3"),
    dataSample(name: "Data 4", icon: "tray", detail: "This is details data 4"),
    ]
}

struct PrimaryView: View {
    
    @State private var searchQuery = ""
    
    var body: some View {
        List{
            ForEach(dataExample.example.filter({
                searchQuery.isEmpty ? true :
                $0.name.localizedStandardContains(searchQuery)
            })){item in
                NavigationLink(destination: Text(item.detail),label:{
                    HStack{
                        Image(systemName: item.icon)
                            .frame(width: 50, height: 50)
                            .font(.title2)
                            .foregroundColor(.blue)
                        VStack(alignment:.leading){
                            Text(item.name)
                                .font(.title2)
                            Text(item.detail)
                        }
                    }
                })
            }
        }
        .searchable(text: $searchQuery,prompt: "Search for data",suggestions: {
            if !searchQuery.isEmpty{
                ForEach(dataExample.example.filter({
                    searchQuery.isEmpty ? true : $0.name.localizedStandardContains(searchQuery)
                })){suggestion in
                    Text(suggestion.name)
                        .searchCompletion(suggestion.name)
                }
            }
        })
    }
}

struct PrimaryView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryView()
    }
}
