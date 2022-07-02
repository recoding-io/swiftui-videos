//
//  NavigationView.swift
//  Navigation_Stack_SwiftUI_4
//
//  Created by Haaris Iqubal on 6/17/22.
//

import SwiftUI

struct NavigationViewSource: View {
    @EnvironmentObject private var navigationModel: NavigationModel
    var dataModel = DataModel.shared
    
    var body: some View {
        NavigationStack(path: $navigationModel.carPath){
            List(Category.allCases){category in
                Section{
                    ForEach(dataModel.cars(in: category)){car in
                        NavigationLink(car.name, value: car)
                    }
                } header: {
                    Text(category.localizedName)
                }
            }
            .navigationTitle("Cars Show Room")
            .navigationDestination(for: Car.self){ car in
                ScrollView{
                    CarDetailView(car: car){relatedCar in
                        NavigationLink(value: relatedCar){
                            VStack{
                                if relatedCar.image != nil {
                                    Image(relatedCar.image!)
                                        .resizable()
                                        .frame(width: 300, height: 180)
                                        .aspectRatio(contentMode: .fit)
                                }
                                HStack{
                                    Text(relatedCar.name)
                                    Text(relatedCar.description)
                                        .foregroundColor(.gray)
                                }
                            }
                            .foregroundColor(.blue)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }
}

struct NavigationViewSource_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewSource()
            .environmentObject(NavigationModel())
    }
}
