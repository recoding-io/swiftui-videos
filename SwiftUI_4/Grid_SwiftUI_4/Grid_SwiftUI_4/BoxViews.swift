//
//  BoxViews.swift
//  Grid_SwiftUI_4
//
//  Created by Haaris Iqubal on 8/24/22.
//

import SwiftUI

struct BoxViews: View {
    var body: some View {
        Grid{
            GridRow{
                Color.clear
                Color.clear
                Color.clear
                Color.mint
                    .cornerRadius(20)
                
            }
            GridRow{
                Color.clear
                Color.clear
                Color.blue
                    .cornerRadius(20)
                Color.green
                    .cornerRadius(20)
                Color.gray
                    .cornerRadius(20)
            }
            GridRow{
                Color.clear
                Color.blue
                    .cornerRadius(20)
                Color.green
                    .cornerRadius(20)
                Color.gray
                    .cornerRadius(20)
                Color.blue
                    .cornerRadius(20)
                Color.green
                    .cornerRadius(20)
            }
            GridRow{
                ForEach(0..<7){ _ in
                    Color.red.cornerRadius(20)
                }
            }
            GridRow{
                Color.clear
                Color.blue
                    .cornerRadius(20)
                Color.green
                    .cornerRadius(20)
                Color.gray
                    .cornerRadius(20)
                Color.blue
                    .cornerRadius(20)
                Color.green
                    .cornerRadius(20)
            }
            GridRow{
                Color.clear
                Color.clear
                Color.blue
                    .cornerRadius(20)
                Color.green
                    .cornerRadius(20)
                Color.gray
                    .cornerRadius(20)
            }
            GridRow{
                Color.clear
                Color.clear
                Color.clear
                Color.mint
                    .cornerRadius(20)
                
            }
        }
        .padding()
    }
}

struct BoxViews_Previews: PreviewProvider {
    static var previews: some View {
        BoxViews()
    }
}
