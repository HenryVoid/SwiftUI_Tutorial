//
//  KeyboardMonitor.swift
//  Keyboard_Event
//
//  Created by 송형욱 on 2022/04/13.
//

import Foundation
import Combine
import UIKit

final class KeyboardMonitor: ObservableObject { // 상속이 불가능하게 final class로 선언
    
    enum Status {
        case show, hide
        var description: String {
            switch self {
            case .show: return "보임"
            case .hide: return "안보임"
            }
        }
    }
    
    var subscriptions = Set<AnyCancellable>()
    
//    @Published var updatedKeyboardStatusAction: Status = .hide
    @Published var keyboardHeight: CGFloat = 0.0
    
    lazy var updatedKeyboardStatusAction: AnyPublisher<Status, Never> = $keyboardHeight
        .map { (height: CGFloat) -> KeyboardMonitor.Status in
            return height > 0 ? .show : .hide
    }.eraseToAnyPublisher()
    
    init() {
        print("KeyboardMonitor - init() called")
        
        // NotificationCenter로 이벤트 받는 것을 combine으로 받을 수 있음 (publiser로) apple이 열일했음
        
//        // 키보드 올라올때
//        NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillShowNotification)
//            .sink { (noti: Notification) in
//                print("KeyboardMonitor - keyboardWillShowNotification: noti: ", noti)
//                self.updatedKeyboardStatusAction = .show
//            }
//            .store(in: &subscriptions)
//
//        // 키보드 내려갈때
//        NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillHideNotification)
//            .sink { (noti: Notification) in
//                print("KeyboardMonitor - keyboardWillHideNotification: noti: ", noti)
//                self.updatedKeyboardStatusAction = .hide
//                self.keyboardHeight = 0.0
//            }
//            .store(in: &subscriptions)
//
//        // 키보드 크기가 변경될때
//        NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillChangeFrameNotification)
//            .sink { (noti: Notification) in
//                print("KeyboardMonitor - keyboardDidChangeFrameNotification: noti: ", noti)
//                if let rect = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
//                    self.keyboardHeight = rect.height
//                }
//            }
//            .store(in: &subscriptions)
        
        // 키보드 올라올때 -> 키보드높이
        NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillShowNotification)
            .merge(with: NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillChangeFrameNotification))
            .compactMap { (noti: Notification) -> CGRect in
                return noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
            }
            .map { (keyboardFrame: CGRect) -> CGFloat in
                return keyboardFrame.height
            }
            .subscribe(Subscribers.Assign(object: self, keyPath: \.keyboardHeight))
        
        NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillHideNotification)
            .compactMap { (noti: Notification) -> CGFloat in
                return .zero
            }
            .subscribe(Subscribers.Assign(object: self, keyPath: \.keyboardHeight))
    }
}
