//
//  Web.swift
//  SwiftUIWebView
//
//  Created by monkey on 2021/4/13.
//  使用 UIView：自定义 struct 实现 UIViewRepresentable 协议
//  UIViewRepresentable 协议主要有两个方法 makeUIView、updateUIView

import SwiftUI
import WebKit

struct Web: UIViewRepresentable {
    
    let url: URL?
    
    func makeUIView(context: Context) -> WKWebView {
        
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = preferences
        
        let webView = WKWebView(frame: .zero, configuration: config)
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        guard let url = url else {
            return
        }
        
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
