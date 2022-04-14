//
//  ContentView.swift
//  SplashScreen
//
//  Created by 송형욱 on 2022/04/14.
//

import SwiftUI

struct ContentView: View {
    
    @State var isContentReady: Bool = false
    
    var body: some View {
        ZStack {
            Text("Hello, world!")
                .padding()
            if !isContentReady {
                LottieView(jsonName: "LoadingLottie")
                    .transition(.opacity)
//                mySplashScreenView.transition(.opacity)
            }
        }
        .onAppear {
            print("ContentView - onAppear() called")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
                print("ContentView - onAppear() after 1.25s")
                withAnimation { isContentReady.toggle() }
            }
        }
    }
}

//MARK: - 스플래시 스크린
extension ContentView {
    var mySplashScreenView: some View {
        Color.yellow.edgesIgnoringSafeArea(.all)
            .overlay(alignment: .center) {
                Text("스플래시 입니다!")
                    .font(.largeTitle)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
