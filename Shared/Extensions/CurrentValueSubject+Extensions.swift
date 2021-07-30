//
//  CurrentValueSubject+Extensions.swift
//  Trening_CleanArchitecture
//
//  Created by User on 31/07/2021.
//

import Combine

extension CurrentValueSubject {
    func updates<Value>(for keyPath: KeyPath<Output, Value>) ->
        AnyPublisher<Value, Failure> where Value: Equatable {
        return map(keyPath).removeDuplicates().eraseToAnyPublisher()
    }
}
