//
//  ObservableObject.swift
//  NewsAppMVVM
//
//  Created by BJIT on 1/26/23.
//

import Foundation

/// Generic class to use for all type of data which has a functionality to call a closure whenever the data updates
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

    /// bind function for the listener
    /// - Parameter listener: closure to get the object value
    func bind(listener: @escaping (T) -> Void) {
        self.listener = listener
    }
}
