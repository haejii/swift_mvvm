//
//  ViewModel.swift
//  MVVM(1)
//
//  Created by 양혜지 on 2022/02/11.
//

import Foundation
import UIKit

public class ViewModel {
    
    // 아무 설정 없는 초기의 View를 보여주기 위한 목적의 변수 초기화
    let defaultName = "홍길동"
    let defaultAge = "25"
    let defaultImage = "person"
    
    
    // 변수 초기화
    let name = Observable("")
    let age = Observable("")
    // 변수의 자료형 명시
    let image: Observable<UIImage?> = Observable(nil)
    
    init() {
        setName(to: defaultName)
        setAge(to: defaultAge)
        setImage(to: defaultImage)
    }
    
    
    // value를 바꾸어서 didSet이 실행되도록 함
    func setName(to name: String) {
        self.name.value = name
    }
    
    func setAge(to age: String) {
        self.age.value = age
    }
    
    func setImage(to image: String) {
        if let image = UIImage(systemName: image) {
            self.image.value = image
        }
    }
}
