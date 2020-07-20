//
//  LottieView.swift
//  CoVid
//
//  Created by Linda Zungu on 7/16/20.
//  Copyright © 2020 Linda Zungu. All rights reserved.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    let animationView = AnimationView()
    var fileName = "LottieLogo2"
    var loopMode: LottieLoopMode = .playOnce
    var loopSpeed: CGFloat = AnimationView().animationSpeed
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView()
        
        let animation = Animation.named(fileName)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode // to loop the view
        animationView.animationSpeed = loopSpeed //speed of the animation
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
//        animationView.reloadImages()
        animationView.play()
    }
}

