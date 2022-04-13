//
//  ContentView.swift
//  Keyboard_Event
//
//  Created by 송형욱 on 2022/04/13.
//

import Foundation
import SwiftUI

struct ContentView : View {
    @State var nameInput: String = ""
    @State var emailInput: String = ""
    @State var passwordInput: String = ""
    @State var passwordConfirmInput: String = ""
    
    var body: some View{
        VStack(alignment: .leading){
            VStack(alignment: .leading) {
                Text("이름")
                TextField("이름을 입력해주세요", text: $nameInput).keyboardType(.default).autocapitalization(.none)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(.yellow))
            VStack(alignment: .leading) {
                Text("이메일")
                TextField("이메일", text: $emailInput).keyboardType(.emailAddress).autocapitalization(.none)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(.yellow))
            VStack(alignment: .leading) {
                Text("비밀번호")
                SecureField("비밀번호 확인", text: $passwordConfirmInput).keyboardType(.default)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(.yellow))
            
            Rectangle().fill(Color.red).frame(maxHeight: 300)
            
            GeometryReader { proxy in
                Button {
                    print("회원가입 버튼 클릭")
                } label: {
                    Text("회원가입하기")
                        .foregroundColor(.black)
                        .font(.title2)
                        .frame(maxWidth: proxy.frame(in: .named("containerVStack")).width)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(.yellow))
            }
        }// VStack
        .background(Color.purple)
        .padding(.horizontal, 20)
        .coordinateSpace(name: "containerVStack")
        .navigationTitle("회원가입")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
