//
//  ObservableObject.swift
//  CompanyFinder
//
//  Created by Reddy M on 27/06/2022.
//

import Foundation
class ObservableObject<T> {
    var value: T {
        didSet {
            listener?(value)
        }
    }

    private var listener: ((T) -> Void)?

    init(_ value: T) {
        self.value = value
    }

    func bind(_ listener: @escaping (T) -> Void) {
        listener(value)
        self.listener = listener
    }
}
