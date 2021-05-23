//
//  ContentView.swift
//  Instagram-Stories-App
//
//  Created by Haaris Iqubal on 5/15/21.
//

import SwiftUI

struct ContentView: View {
    var images:[String] = ["image-1","image-2","image-3","image-4","image-5"]
    @ObservedObject var countTimer:CountTimer = CountTimer(items: 5,interval: 4.0)
    var body: some View {
        GeometryReader{geometry in
            ZStack(alignment: .top){
                Image(self.images[Int(self.countTimer.progress)])
                    .resizable()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .scaledToFill()
                    .frame(width: geometry.size.width,height: nil,alignment: .center)
                    .animation(.none)
                
                HStack(alignment: .center, spacing: 4){
                    ForEach(self.images.indices){ image in
                        LoadingBar(progress: min( max( (CGFloat(self.countTimer.progress) - CGFloat(image)), 0.0) , 1.0) )
                            .frame(width:nil,height: 2, alignment:.leading)
                            .animation(.linear)
                    }
                    
                }
                .padding()
                HStack(alignment:.center,spacing:0){
                    Rectangle()
                        .foregroundColor(.clear)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            self.countTimer.advancePage(by: -1)
                        }
                    Rectangle()
                        .foregroundColor(.clear)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            self.countTimer.advancePage(by: 1)
                        }
                    
                }
        }
            .onAppear{
                self.countTimer.start()
            }
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
