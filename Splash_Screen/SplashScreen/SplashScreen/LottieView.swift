//
//  LottieView.swift
//  SplashScreen
//
//  Created by 송형욱 on 2022/04/14.
//

import Foundation
import SwiftUI
import UIKit
import Lottie

struct LottieView: UIViewRepresentable {
    var name: String
    var loopMode: LottieLoopMode = .loop
    
    init(
        jsonName: String,
        loopMode: LottieLoopMode = .loop
    ) {
        print("LottieView - init() called / jsonName: ", jsonName)
        self.name = jsonName
    }

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        print("LottieView - makeUIView() called")
        let view = UIView(frame: .zero)

        let animationView = AnimationView()
        let animation = Animation.named(name)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        print("LottieView - makeUIView() called")
    }
}
