//
//  CarDetailView.swift
//  Navigation_Stack_SwiftUI_4
//
//  Created by Haaris Iqubal on 6/17/22.
//

import SwiftUI

struct CarDetailView<Link: View>: View {
    @EnvironmentObject private var navigationModel: NavigationModel
    var car: Car?
    var relatedLink: (Car) -> Link
    
    var body: some View {
        if let car = car{
            VStack{
                if car.image != nil{
                    Image(car.image!).aspectRatio(contentMode: .fill)
                }
                Text(car.description)
                    .font(.title2)
                    .foregroundColor(.gray)
                
                Text("Related Cars")
                    .font(.title2)
                
                Context(car: car, relatedLink: relatedLink)
            }
            .navigationTitle(car.name)
            .toolbar{
                Button(action: {
                    navigationModel.carPath.removeAll()
                }, label: {
                    Label("Remove all path", systemImage: "trash.fill")
                })
            }
        }
        else{
            Text("Select Car")
                .navigationTitle("Choose Car")
        }
    }
}

private struct Context<Link: View> : View{
    @EnvironmentObject private var navigationModel: NavigationModel
    var car: Car
    var dataModel = DataModel.shared
    var relatedLink: (Car) -> Link
    
    var body: some View{
        ScrollView(.horizontal){
            HStack(spacing: 20){
                let relatedCars = dataModel.relatedCars(relatedTo: car, carPath: navigationModel.carPath)
                ForEach(relatedCars){carItem in
                    relatedLink(carItem)
                }
            }
            .padding(.leading, 50)
            .padding(.trailing, 50)
            .padding(.bottom, 10)
        }
    }
}

struct CarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CarDetailView(car: .mock, relatedLink: link)
                .environmentObject(NavigationModel())
            CarDetailView(car: nil, relatedLink: link)
        }
    }
    
    static func link(car: Car) -> some View{
        EmptyView()
    }
}
