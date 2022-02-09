//
//  AddTagView.swift
//  CD_Many_To_Many_Relationship
//
//  Created by Haaris Iqubal on 2/3/22.
//

import SwiftUI

struct AddTagView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var tagTitle = ""
    @State private var selectedColor = 0
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Add Tag Title",text: $tagTitle)
                Picker("Select Colors", selection: $selectedColor){
                    ForEach(0..<ExtraColor.colorsNames.count,id: \.self){index in
                        HStack{
                            Circle().fill(Color(ExtraColor.colors[index]))
                                .frame(width: 40, height: 40)
                            Text(ExtraColor.colorsNames[index]).tag(index)
                        }
                    }
                    .navigationTitle("Select Colors")
                }
                Button(action: {
                    // Add function to add Tag
                    addTagItem()
                    dismiss()
                }, label: {
                    Text("Save")
                })
            }
        }
    }
    private func addTagItem(){
        let tag = Tag(context: viewContext)
        tag.id = UUID()
        tag.title = tagTitle
        tag.color = ExtraColor.colors[selectedColor]
        do{
            try viewContext.save()
        }
        catch{
            print(error.localizedDescription)
        }
    }
}

struct AddTagView_Previews: PreviewProvider {
    static var previews: some View {
        AddTagView()
    }
}
