//
//  ContentView.swift
//  Object_Recognition_with_Core_ML
//
//  Created by Haaris Iqubal on 9/11/22.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    
    @State private var selectedImage: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
        
    var classifier = Classifier()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top){
                if let selectedImageData, let uiImage = UIImage(data: selectedImageData){
                    Image(uiImage:  uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                else{
                    Text("Select image by tapping picker button.")
                        .foregroundColor(.gray)
                        .font(.system(size: 40))
                        .bold()
                        .multilineTextAlignment(.center)
                }
                
                if classifier.result != nil {
                    VStack(alignment: .leading){
                        ForEach(classifier.result!.components(separatedBy: ","), id: \.self){item in
                            Text("• \(item.capitalized)")
                                .font(.title2)
                        }
                        Text("• Confidence \(classifier.confidence!,specifier: "%.2f")")
                            .font(.title2)
                    }
                    .padding()
                    .background(.regularMaterial)
                    .cornerRadius(5)
                    .padding(.top,10)
                }
            }
            .navigationTitle("Image Recognizer")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                HStack{
                    PhotosPicker(selection: $selectedImage, matching: .images, label: {
                        Label("Select Image", systemImage: "photo")
                    })
                    .onChange(of: selectedImage){newItem in
                        Task{
                            if let data = try? await newItem?.loadTransferable(type: Data.self){
                                selectedImageData = data
                                classifier.detect(ciImage: CIImage(data: data)!)
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
