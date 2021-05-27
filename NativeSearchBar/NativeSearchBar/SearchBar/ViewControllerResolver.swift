//
//  ViewControllerResolver.swift
//  NativeSearchBar
//
//  Created by Haaris Iqubal on 5/26/21.
//

import SwiftUI

final class ViewControllerResolver: UIViewControllerRepresentable {
    let onResolve: (UIViewController) -> Void
    
    init(onResolve: @escaping (UIViewController) -> Void) {
        self.onResolve = onResolve
    }
    func makeUIViewController(context: Context) -> ParentResolverViewController {
        ParentResolverViewController(onResolve: onResolve)
    }
    func updateUIViewController(_ uiViewController: ParentResolverViewController, context: Context) {
        
    }
}

class ParentResolverViewController: UIViewController{
    let onResolve: (UIViewController) -> Void
    
    init(onResolve: @escaping (UIViewController) -> Void){
        self.onResolve = onResolve
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("Use init(onResolve:) to intantiate ParentResolverViewControler.")
    }
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        if let parent = parent{
            onResolve(parent)
        }
    }
}
