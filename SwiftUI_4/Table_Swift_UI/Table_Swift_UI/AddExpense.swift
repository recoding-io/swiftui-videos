//
//  AddExpense.swift
//  Table_Swift_UI
//
//  Created by Haaris Iqubal on 8/4/22.
//

import SwiftUI

struct AddExpense: View {
    @EnvironmentObject private var expenses: ExpenseData
    @Environment(\.dismiss) var dismiss
    @State private var itemName = ""
    @State private var itemPrice = ""
    @State private var typeOfExpense: TypeOfExpense = .credit
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Item Name", text: $itemName)
                TextField("Item Price", text: $itemPrice)
                    .keyboardType(.numberPad)
                Picker("Choose Type of Expense", selection: $typeOfExpense){
                    ForEach(TypeOfExpense.allCases) { expense in
                        Text(expense.localizedName).tag(expense)
                    }
                }
                .pickerStyle(.menu)
            }
            .navigationTitle("Add Person")
            
            Button(action: {
                let expense = Expenses(itemName: itemName, itemPrice: Int(itemPrice) ?? 0, typeOfExpense: typeOfExpense)
                expenses.exampleData.append(expense)
                dismiss()
            }, label: {
                Label("Save Expense", systemImage: "externaldrive")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderedProminent)
        }
    }
}

struct AddExpense_Previews: PreviewProvider {
        
    static var previews: some View {
        AddExpense()
            .environmentObject(ExpenseData())
    }
}
