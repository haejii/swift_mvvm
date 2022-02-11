//
//  Observable.swift
//  MVVM(1)
//
//  Created by 양혜지 on 2022/02/11.
//

import Foundation

class Observable<T> {
    
    typealias Listener = (T) -> Void
    
    var listener: Listener?
    
    // 값이 변할 때마다 클로저 listener를 호출한다. (View의 액션에 따라서 자동으로 View Model 의 값이 최신화.)
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        self.listener = closure
        listener?(value)
    }
}
