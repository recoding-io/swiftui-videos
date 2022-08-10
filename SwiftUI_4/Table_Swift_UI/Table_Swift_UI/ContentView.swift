//
//  ContentView.swift
//  Table_Swift_UI
//
//  Created by Haaris Iqubal on 8/4/22.
//

import SwiftUI

enum TypeOfExpense: Int, Hashable, CaseIterable, Identifiable, Comparable{
    static func < (lhs: TypeOfExpense, rhs: TypeOfExpense) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }

    var id: Int{rawValue}
    case credit
    case debit
    
    var localizedName:LocalizedStringKey{
        switch(self){
        case .credit:
            return "Credit"
        case .debit:
            return "Debit"
        }
    }
    
}

struct Expenses: Identifiable{
    let id = UUID()
    var itemName:String
    var itemPrice: Int
    var typeOfExpense: TypeOfExpense
}

class ExpenseData: ObservableObject {
    @Published var exampleData = [
        Expenses(itemName: "Burger", itemPrice: 30, typeOfExpense: .debit),
        Expenses(itemName: "Pasta", itemPrice: 50, typeOfExpense: .debit),
        Expenses(itemName: "Investment", itemPrice: 1000, typeOfExpense: .credit)
    ]
}

struct ContentView: View {
    
    @StateObject private var expenses = ExpenseData()
    
    @State private var selectExpense = Set<Expenses.ID>()
    
    @State private var sortOrder = [KeyPathComparator(\Expenses.itemName)]
    
    @State private var isSheet = false
    
    var body: some View {
        NavigationStack{
            VStack{
                Table(expenses.exampleData, selection: $selectExpense, sortOrder: $sortOrder){
                    TableColumn("Item Name", value: \.itemName)
                    TableColumn("Item Price", value: \.itemPrice){value in
                        Text("$ \(value.itemPrice)")
                    }
                    TableColumn("Type", value: \.typeOfExpense){value in
                        if value.typeOfExpense == .credit{
                            Text(value.typeOfExpense.localizedName)
                                .foregroundColor(.green)
                        }
                        else{
                            Text(value.typeOfExpense.localizedName)
                                .foregroundColor(.red)
                        }
                    }
                }
                .onChange(of: sortOrder){
                    expenses.exampleData.sort(using: $0)
                }
                HStack{
                    Text("\(expenses.exampleData.count) entries")
                    
                    Spacer()
                    
                    Text("\(selectExpense.count) items are selected")
                }
                .padding(.leading)
                .padding(.trailing)
            }
            .navigationTitle("Table View")
            .sheet(isPresented: $isSheet){
                AddExpense()
                    .environmentObject(expenses)
            }
            .toolbar{
                ToolbarItem(placement: .primaryAction){
                    HStack{
                        Button(action: {
                            isSheet.toggle()
                        }, label: {
                            Label("Open Expense Sheet", systemImage: "plus")
                        })
                        Button(action: {
                            for item in selectExpense{
                                if let index = expenses.exampleData.firstIndex(where: {$0.id == item}){
                                    expenses.exampleData.remove(at: index)
                                }
                            }
                            selectExpense = Set<Expenses.ID>()
                        }, label: {
                            Label("Delete Item", systemImage: "trash")
                        })
                    }
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
