//
//  SecondaryView.swift
//  SecondaryView
//
//  Created by Haaris Iqubal on 10/12/21.
//

import SwiftUI

struct SecondaryView: View {
    
    @State private var searchQuery = ""
    
    var body: some View {
        VStack{
            SearchContent(queryString: searchQuery)
        }
        .searchable(text: $searchQuery)
    }
}


struct SearchContent:View{
    
    var queryString:String
    
    
    @Environment(\.isSearching) var isSeaching
    @Environment(\.dismissSearch) var dismissSearch
    var body: some View{
        VStack{
            Text(queryString)
            Text(isSeaching ? "Searching" : "Not Searching")
            if isSeaching{
                Button("Dismiss"){
                    dismissSearch()
                }
            }
        }
    }
}

struct SecondaryView_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryView()
    }
}
