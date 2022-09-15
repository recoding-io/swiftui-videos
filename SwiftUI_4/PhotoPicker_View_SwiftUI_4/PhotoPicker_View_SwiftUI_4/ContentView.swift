//
//  ContentView.swift
//  PhotoPicker_View_SwiftUI_4
//
//  Created by Haaris Iqubal on 9/11/22.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    
    @State private var selectedImage:[PhotosPickerItem] = []
    @State private var selectedImageData: [Data] = []
    
    var body: some View {
        NavigationStack {
            VStack{
                if selectedImageData.count > 0{
                    // Show Image
                    ScrollView{
                        LazyVGrid(columns: [.init(.adaptive(minimum: 200)), .init(.adaptive(minimum: 200))]){
                            ForEach(selectedImageData, id: \.self){dataItem in
                                if let dataItem = dataItem, let uiImage = UIImage(data: dataItem){
                                    Image(uiImage: uiImage).resizable().frame(width: 180, height: 150).aspectRatio(contentMode: .fill).cornerRadius(10)
                                }
                            }
                        }
                        .padding()
                    }
                }
                else{
                    Spacer()
                    Text("Please select image by tapping on photo icon on toolbar").foregroundColor(.gray).font(.system(size: 25)).bold().multilineTextAlignment(.center)
                }
                Spacer()
                Text("\(selectedImageData.count) photos")
            }
            .navigationTitle("Photo Album")
            .toolbar{
                PhotosPicker(selection: $selectedImage,maxSelectionCount: 50 ,matching: .images, label: {
                    Image(systemName: "photo.fill").tint(.mint)
                })
                .onChange(of: selectedImage){newItem in
                    Task{
                        selectedImage = []
                        for item in newItem {
                            if let data = try? await item.loadTransferable(type: Data.self){
                                selectedImageData.append(data)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
