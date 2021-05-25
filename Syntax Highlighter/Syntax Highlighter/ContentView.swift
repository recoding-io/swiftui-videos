//
//  ContentView.swift
//  Syntax Highlighter
//
//  Created by Haaris Iqubal on 5/23/21.
//

import SwiftUI

struct ContentView: View {
    @State private var text = "<html>\r <head> \r <title> Hello World </title> </head> \r <h1>Welcome to Recoding</h1>\r </html>\r"
    var body: some View {
        HighlightEditor(text: $text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
