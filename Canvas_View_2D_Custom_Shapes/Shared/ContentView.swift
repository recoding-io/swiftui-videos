//
//  ContentView.swift
//  Shared
//
//  Created by Haaris Iqubal on 5/22/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView{
            
            // Ellipse
            
            Canvas{context, size in
                let rect = CGRect(origin: .zero, size: size).insetBy(dx: 10, dy: 10)
                
                context.stroke(Path(ellipseIn: rect), with: .color(.orange), lineWidth: 4)
            }
            .padding()
            .frame(width:300, height: 200)
            .border(Color.yellow, width: 4)
            
            
            // Triangle
            
            Canvas{context, size in
                let rect = CGRect(origin: .zero, size: size)
                context.fill(triangle(in: rect), with: .color(.red))
            }
            .padding()
            .frame(width: 300, height: 200)
            .border(Color.green, width: 4)
            
            // Rectangle
            
            Canvas{context, size in
                let rect = CGRect(origin: .zero, size: size)
                
                context.fill(Path(roundedRect: rect, cornerSize: CGSize(width: 10, height: 10)), with: .color(.yellow))
            }
            .padding()
            .frame(width: 300, height: 200)
            .border(Color.orange, width: 4)
        
            // Arc
            
            Canvas{context, size in
                let rect = CGRect(origin: .zero, size: size)
                    .insetBy(dx: 50, dy: 50)
                
                context.stroke(arc(in: rect), with: .color(.indigo), lineWidth: 5)
            }
            .padding()
            .frame(width: 300, height: 200)
            .border(Color.brown, width: 4)
        }
    }
    
    func triangle(in rect:CGRect) -> Path{
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
    
    func arc(in rect: CGRect) -> Path {
        let startingAngle: Double = 90
        let path = Path() {path in
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: .degrees(startingAngle), endAngle: .degrees(-90), clockwise: true)
        }
        
        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
