//
//  ContentView.swift
//  Grid_SwiftUI_4
//
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        
        NavigationStack{
            VStack{
                Text("This is V Stack")
                    .font(.title)
                HStack{
                    Text("Hello")
                    Text("World")
                }
                Divider()
                HStack{
                    Text("This is new Grid API for SwiftUI ")
                    Text("Hope You like it")
                }
            }
            Text("This is Grid")
                .font(.title)
            Grid{
                GridRow{
                    Text("Hello")
                    Text("World")
                }
                Divider()
                    .gridCellUnsizedAxes(.horizontal)
                GridRow{
                    Text("This is new Grid API for SwiftUI ")
                    Text("Hope You like it")
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
