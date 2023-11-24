//
//  IM+Array.swift
//  iManagement
//
//  Created by Mickael Belhassen on 24/11/2023.
//

import Foundation

extension Collection {

    func removingDuplicates<T: Hashable>(by key: (Element) -> T) -> [Element] {
        var seen = Set<T>()
        return filter { seen.insert(key($0)).inserted }
    }

}
