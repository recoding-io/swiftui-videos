//
//  WKView.swift
//  WebKitBrowser
//
//  Created by Haaris Iqubal on 5/28/21.
//

import SwiftUI
import WebKit

struct WKView:UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    
    @ObservedObject var webViewStateModel: WebViewStateModel
    typealias UIViewType = WKWebView
    
    class Coordinator: NSObject,WKNavigationDelegate {
        let parent:WKView
        init(_ parent:WKView) {
            self.parent = parent
        }
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            if parent.webViewStateModel.goBack{
                webView.goBack()
                parent.webViewStateModel.goBack = false
            }
            if parent.webViewStateModel.goForward{
                webView.goForward()
                parent.webViewStateModel.goForward = false
            }
        }
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView(frame: CGRect.zero)
        view.navigationDelegate = context.coordinator
        view.allowsBackForwardNavigationGestures = true
        view.scrollView.isScrollEnabled = true
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: webViewStateModel.pageTitle)!))
        if webViewStateModel.goToPage{
            uiView.load(URLRequest(url: URL(string: webViewStateModel.pageTitle)!))
            webViewStateModel.goToPage = false
        }
    }
}
