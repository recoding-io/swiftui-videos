//
//  SearchBar.swift
//  NativeSearchBar
//
//  Created by Haaris Iqubal on 5/26/21.
//

import SwiftUI

class SearchBar: NSObject, ObservableObject{
    @Published var text:String = ""
    let searchController:UISearchController = UISearchController(searchResultsController: nil)
    
    override init() {
        super.init()
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchResultsUpdater = self
    }
}

extension SearchBar: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        if let searchBarText = searchController.searchBar.text {
            self.text = searchBarText
        }
    }
}

struct SearchBarModifier: ViewModifier {
    let searchBar: SearchBar
    
    func body(content: Content) -> some View {
        content.overlay(ViewControllerResolver{
            viewController in
            viewController.navigationItem.searchController = self.searchBar.searchController
        }
        .frame(width:0, height: 0)
        )
    }
}

extension View{
    func add(_ searchBar: SearchBar) -> some View {
        return self.modifier(SearchBarModifier(searchBar: searchBar))
    }
}
