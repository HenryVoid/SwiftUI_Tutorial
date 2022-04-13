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
    
    @ObservedObject var keyboardMonitor: KeyboardMonitor = KeyboardMonitor()
    @State var keyboardStatusInfo: String = ""
    
    @State var keyboardStatus: KeyboardMonitor.Status = .hide
    
    var body: some View{
        VStack(alignment: .leading){
            VStack(alignment: .leading, spacing: 0) {
                Text("키보드 상태").font(.title2)
                Divider().colorMultiply(.clear).padding(.vertical, 5)
//                Text(keyboardMonitor.updatedKeyboardStatusAction.description) // 1
                Text(keyboardStatusInfo)
                Text("높이 : \(keyboardMonitor.keyboardHeight)")
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(.yellow))
            .onReceive(self.keyboardMonitor.updatedKeyboardStatusAction, perform: {
                self.keyboardStatusInfo = $0.description
                self.keyboardStatus = $0
            })
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
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("주의사항")
                    Text("sajdflsajfladshfksanfkjzsndkfjznxjvnzsldnfoiajflkasmdflksdmfkzmolvjzxclvlzkxmlvkcmxlkzvnzxlcnvlkcnxjvnxcjnvlkxcmvlkxczmvlkxcmvlxkvmohoafekmwflkmlkvmzxoicvjoxzkcmvlzxkmvl\nafosdjfosiafjalskdmlkxzfmvlkxcvlkxzjcvlkzxcjvlkxzjcvoijlwakrmlksmvlksd\naosidfjaowijfalksvmnozxhuoxvmlkxcnvoshofajsdoimvlkzmxlkvhoajfoisd\nasdljfsadljoiszjvoizsdjvlkzsmdlvkznsdlkvjsaoivjjasdfoisajflkadsmflksmflzkxdfoisdjfoasdjflksdmflkzdxmfoizsdjfosdmflkasdmflka\nasdiofjdsoifjalsdfsadflksajdfsa\nasdiofjsaiofjslkzmxlkvmxcoivjozijcxvlkxmclkvzxnvoixzjnvoxkzmvlkcxmvlkzxvlkzxcjvoicxzcjvoxckmvlkxcmvlcxkvjoizxjcvoxzjvoizxsajdflsajfladshfksanfkjzsndkfjznxjvnzsldnfoiajflkasmdflksdmfkzmolvjzxclvlzkxmlvkcmxlkzvnzxlcnvlkcnxjvnxcjnvlkxcmvlkxczmvlkxcmvlxkvmohoafekmwflkmlkvmzxoicvjoxzkcmvlzxkmvl\nafosdjfosiafjalskdmlkxzfmvlkxcvlkxzjcvlkzxcjvlkxzjcvoijlwakrmlksmvlksd\naosidfjaowijfalksvmnozxhuoxvmlkxcnvoshofajsdoimvlkzmxlkvhoajfoisd\nasdljfsadljoiszjvoizsdjvlkzsmdlvkznsdlkvjsaoivjjasdfoisajflkadsmflksmflzkxdfoisdjfoasdjflksdmflkzdxmfoizsdjfosdmflkasdmflka\nasdiofjdsoifjalsdfsadflksajdfsa\nasdiofjsaiofjslkzmxlkvmxcoivjozijcxvlkxmclkvzxnvoixzjnvoxkzmvlkcxmvlkzxvlkzxcjvoicxzcjvoxckmvlkxcmvlcxkvjoizxjcvoxzjvoizxsajdflsajfladshfksanfkjzsndkfjznxjvnzsldnfoiajflkasmdflksdmfkzmolvjzxclvlzkxmlvkcmxlkzvnzxlcnvlkcnxjvnxcjnvlkxcmvlkxczmvlkxcmvlxkvmohoafekmwflkmlkvmzxoicvjoxzkcmvlzxkmvl\nafosdjfosiafjalskdmlkxzfmvlkxcvlkxzjcvlkzxcjvlkxzjcvoijlwakrmlksmvlksd\naosidfjaowijfalksvmnozxhuoxvmlkxcnvoshofajsdoimvlkzmxlkvhoajfoisd\nasdljfsadljoiszjvoizsdjvlkzsmdlvkznsdlkvjsaoivjjasdfoisajflkadsmflksmflzkxdfoisdjfoasdjflksdmflkzdxmfoizsdjfosdmflkasdmflka\nasdiofjdsoifjalsdfsadflksajdfsa\nasdiofjsaiofjslkzmxlkvmxcoivjozijcxvlkxmclkvzxnvoixzjnvoxkzmvlkcxmvlkzxvlkzxcjvoicxzcjvoxckmvlkxcmvlcxkvjoizxjcvoxzjvoizxsajdflsajfladshfksanfkjzsndkfjznxjvnzsldnfoiajflkasmdflksdmfkzmolvjzxclvlzkxmlvkcmxlkzvnzxlcnvlkcnxjvnxcjnvlkxcmvlkxczmvlkxcmvlxkvmohoafekmwflkmlkvmzxoicvjoxzkcmvlzxkmvl\nafosdjfosiafjalskdmlkxzfmvlkxcvlkxzjcvlkzxcjvlkxzjcvoijlwakrmlksmvlksd\naosidfjaowijfalksvmnozxhuoxvmlkxcnvoshofajsdoimvlkzmxlkvhoajfoisd\nasdljfsadljoiszjvoizsdjvlkzsmdlvkznsdlkvjsaoivjjasdfoisajflkadsmflksmflzkxdfoisdjfoasdjflksdmflkzdxmfoizsdjfosdmflkasdmflka\nasdiofjdsoifjalsdfsadflksajdfsa\nasdiofjsaiofjslkzmxlkvmxcoivjozijcxvlkxmclkvzxnvoixzjnvoxkzmvlkcxmvlkzxvlkzxcjvoicxzcjvoxckmvlkxcmvlcxkvjoizxjcvoxzjvoizx")
                        .font(.caption)
                }
            }
            .frame(height: keyboardStatus == .show ? 300 : 0)
            
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
            .padding(.bottom, keyboardStatus == .show ? 100 : 0)
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
