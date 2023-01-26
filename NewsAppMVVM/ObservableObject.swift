//
//  ObservableObject.swift
//  NewsAppMVVM
//
//  Created by BJIT on 1/26/23.
//

import Foundation

class ObservableObject<T> {
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    private var listener: ((T) -> Void)?
    
    func bind(listener: @escaping (T) -> Void) {
        self.listener = listener
    }
    
}
