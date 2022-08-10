//
//  StaticTable.swift
//  Table_Swift_UI
//
//  Created by Haaris Iqubal on 8/4/22.
//

import SwiftUI

struct Purchase:Identifiable{
    let id = UUID()
    var price:Int
    var inflatedPrice: Int
}

struct StaticTable: View {
    var body: some View {
        VStack{
            Table{
                TableColumn("Base Price"){basePrice in
                    Text("\(basePrice.price)")
                }
                TableColumn("Inflated Price"){inflatePrice in
                    Text("\(inflatePrice.inflatedPrice)")
                }
            } rows: {
                ForEach(0..<10){_ in
                    TableRow(Purchase(price: 10, inflatedPrice: 20))
                }
                TableRow(Purchase(price: 20, inflatedPrice: 24))
                TableRow(Purchase(price: 10, inflatedPrice: 34))
                TableRow(Purchase(price: 15, inflatedPrice: 30))
                TableRow(Purchase(price: 20, inflatedPrice: 50))
                TableRow(Purchase(price: 50, inflatedPrice: 100))
            }
        }
    }
}

struct StaticTable_Previews: PreviewProvider {
    static var previews: some View {
        StaticTable()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
