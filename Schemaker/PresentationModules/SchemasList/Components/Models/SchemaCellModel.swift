//
//  SchemaCellModel.swift
//  SchemaCellModel
//
//  Created by Igor Naumenko on 25.07.2021.
//

import Foundation

protocol ISchemaCellModel {
    var title: String { get }
    var lastUpdated: String { get }
    var imageData: Data { get }
}

struct SchemaCellModel: ISchemaCellModel {
    let title: String
    let lastUpdated: String
    let imageData: Data
}
