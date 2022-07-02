//
//  DataModel.swift
//  Navigation_Stack_SwiftUI_4
//
//  Created by Haaris Iqubal on 6/17/22.
//

import Foundation


class DataModel: ObservableObject{
    @Published var cars: [Car] = []
    
    static let shared: DataModel = DataModel()
    
    private init() {
        cars = builtInCars
    }
    
    func cars(in category: Category?) -> [Car] {
        cars
            .filter{$0.category == category}
            .sorted{$0.name < $1.name}
    }
    
    func relatedCars(relatedTo car: Car, carPath: [Car]) -> [Car]{
        var relatedCarsArray = cars
            .filter{$0.category == car.category}
            .sorted{$0.name < $1.name}
        if let index = relatedCarsArray.firstIndex(of: car){
            relatedCarsArray.remove(at: index)
        }
        if carPath.count > 1{
            for carInsidePath in carPath{
                if let index = relatedCarsArray.firstIndex(of: carInsidePath){
                    relatedCarsArray.remove(at: index)
                }
            }
        }
        return relatedCarsArray
    }
    
    var carMock: Car{
        cars.first!
    }
    
}


private let builtInCars: [Car] = {
    var cars = [
        Car(name: "Tesla Model S", category: .superCars, description: "Made by Tesla",image: "tesla model s"),
        Car(name: "Tesla Model Y", category: .superCars, description: "Made by Tesla", image: "tesla model y"),
        Car(name: "Tesla Roadster", category: .street, description: "Made by Tesla", image: "tesla roadster"),
        Car(name: "Ford Mach E", category: .street, description: "Made by Ford", image: "ford mustang mach e"),
        Car(name: "Audi R8", category: .superCars, description: "Made by Audi",image: "audi r8"),
        Car(name: "Porsche 911", category: .superCars, description: "Made by Porsche", image: "porsche 911"),
        Car(name: "Ferrari 812 GTS", category: .superCars, description: "Made by Ferrari", image: "ferrari 812 gts"),
        Car(name: "Aston Martin DB4", category: .classics, description: "Made by Aston Martin", image: "aston martin db4"),
        Car(name: "Jaguar E-Type", category: .classics, description: "Made by Jaquar", image: "jaguar e-type"),
        Car(name: "Mercedes SL 300", category: .classics, description: "Made by Mercedes", image: "mercedes sl 300"),
        Car(name: "Lamborghini Miura", category: .classics, description: "Made by Lamborghini", image: "lamborghini miura")
    ]
    
    return Array(cars)
}()
