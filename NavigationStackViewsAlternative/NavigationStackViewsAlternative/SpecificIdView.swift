//
//  SpecificIdView.swift
//  NavigationStackViewsAlternative
//
//  Created by Haaris Iqubal on 6/2/21.
//

import SwiftUI
import NavigationStack

struct SpecificIdView: View {
    private static let childId = "child1"
    var body: some View {
        NavigationStackView{
            PushView(destination: Child1View(),destinationId: SpecificIdView.childId ,label: {
                Text("Push 1 Child View")
            })
        }
    }
}

struct Child1View: View {
    var body: some View{
        ZStack{
            Color.red.ignoresSafeArea(.all)
            VStack{
                Text("Child 1")
                PushView(destination: Child2View(), label: {
                    Text("Push 2 Child View")
                })
            }
        }
    }
}

struct Child2View:View {
    var body: some View{
        ZStack{
            Color.yellow.ignoresSafeArea(.all)
            VStack{
                Text("Child 2")
                PushView(destination: Child3View(), label: {
                    Text("Push 3 Child View")
                })
            }
        }
    }
}

struct Child3View:View {
    var body: some View{
        ZStack{
            Color.green.ignoresSafeArea(.all)
            VStack{
                PopView(destination: .root, label: {
                    Text("Main View")
                })
                PopView(destination: .view(withId: "child1"), label: {
                    Text("Pop to Child 1")
                })
                PopView{
                    Text("Pop to Child 2")
                }
                Text("Child 3")
                
            }
        }
    }
}

struct SpecificIdView_Previews: PreviewProvider {
    static var previews: some View {
        SpecificIdView()
    }
}
