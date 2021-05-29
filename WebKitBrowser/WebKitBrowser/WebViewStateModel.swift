//
//  WebViewStateModel.swift
//  WebKitBrowser
//
//  Created by Haaris Iqubal on 5/28/21.
//

import Foundation

class WebViewStateModel: ObservableObject{
    @Published var pageTitle:String = "https://google.com"
    @Published var goToPage:Bool = false
    
    @Published var goBack:Bool = false
    @Published var goForward:Bool = false
}
