//
//  SmallLargeView.swift
//  Grid_SwiftUI_4
//
//  Created by Haaris Iqubal on 8/24/22.
//

import SwiftUI

struct SmallBox:View{
    let color:Color
    var body: some View {
        color.frame(width: 100, height: 100)
            .cornerRadius(5)
    }
}

struct LargeBox:View{
    let color:Color
    var body: some View {
        color.frame(width: 200, height: 200)
            .cornerRadius(5)
    }
}

struct SmallLargeView: View {
    var body: some View {
        Grid(alignment: .topTrailing, horizontalSpacing: 50, verticalSpacing: 100){
            GridRow{
                SmallBox(color: .red)
                LargeBox(color: .green)
                SmallBox(color: .red)
            }
            .gridCellAnchor(.bottomLeading)
            GridRow{
                LargeBox(color: .red)
                Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                LargeBox(color: .red)
            }
            GridRow{
                Color.yellow
                    .gridCellUnsizedAxes([.horizontal])
                    .gridCellColumns(3)
                    .cornerRadius(5)
            }
            GridRow{
                LargeBox(color: .red)
                SmallBox(color: .green)
                    .gridCellAnchor(.center)
                LargeBox(color: .red)
            }
        }
    }
}

struct SmallLargeView_Previews: PreviewProvider {
    static var previews: some View {
        SmallLargeView()
    }
}
