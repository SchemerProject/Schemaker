//
//  Array+Extension.swift
//  Array+Extension
//
//  Created by Igor Naumenko on 25.07.2021.
//

import Foundation

extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
