//
//  StackNavigationView.swift
//  CustomStackNavigation
//
//  Created by Haaris Iqubal on 11/5/21.
//

import SwiftUI

struct StackNavigationView<RootContent, SubviewContent>: View where RootContent:View, SubviewContent:View {
    @Binding var currentSubviewIndex:Int
    @Binding var showingSubview:Bool
    
    let subviewByIndex: (Int) -> SubviewContent
    let rootView: () -> RootContent
    
    var body: some View {
        VStack{
            VStack{
                if !showingSubview{
                    rootView()
                        .transition(AnyTransition.move(edge: .leading))
                }
                if showingSubview{
                    StackNavigationSubview(isVisible: self.$showingSubview){
                        self.subviewByIndex(self.currentSubviewIndex)
                    }
                    .transition(AnyTransition.move(edge: .trailing))
                }
            }
        }
    }
    
    init(currentSubviewIndex: Binding<Int>,showingSubview:Binding<Bool>,
         @ViewBuilder subviewByIndex: @escaping (Int) -> SubviewContent,
         @ViewBuilder rootView: @escaping () -> RootContent){
        self._currentSubviewIndex = currentSubviewIndex
        self._showingSubview = showingSubview
        self.subviewByIndex = subviewByIndex
        self.rootView = rootView
    }
    
    private struct StackNavigationSubview<Content>: View where Content: View{
        @Binding var isVisible: Bool
        let contentView: () -> Content
        
        var body: some View{
            VStack{
                contentView()
            }
            .toolbar{
                ToolbarItem(placement: ToolbarItemPlacement.navigation){
                    Button(action: {
                        withAnimation(.easeOut(duration: 0.3)){
                            self.isVisible = false
                        }
                    }, label: {
                        Label("Back", systemImage: "chevron.left")
                    })
                }
            }
        }
    }
    
}

