//
//  LottieView.swift
//  SwiftUILottieAnimations
//
//  Created by monkey on 2021/4/14.
//

import Lottie
import SwiftUI
import UIKit

struct LottieView: UIViewRepresentable {
    
    var fileName: String = "loading"
    
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        
        let view = UIView()
        
        let animation = AnimationView()
        animation.animation = Animation.named(fileName)
        animation.contentMode = .scaleAspectFit
        animation.loopMode = .loop
        animation.play()
        view.addSubview(animation)
        
        animation.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            animation.widthAnchor.constraint(equalTo: view.widthAnchor),
            animation.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        
    }
}
