//
//  DrawingView.swift
//  Drawing Pencil Kit
//
//  Created by Haaris Iqubal on 5/7/21.
//

import SwiftUI

struct DrawingView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    @State var id:UUID?
    @State var data:Data?
    @State var title:String?
    var body: some View {
        VStack{
            DrawingCanvasView(data: data ?? Data(), id: id ?? UUID())
                .environment(\.managedObjectContext, viewContext)
                .navigationBarTitle(title ?? "Untitled",displayMode: .inline)
        }
    }
}

