//
//  SchemasListCellModelFactory.swift
//  SchemasListCellModelFactory
//
//  Created by Igor Naumenko on 25.07.2021.
//

import Foundation

protocol ISchemasListCellModelFactory {
    func create() -> [ISchemaCellModel]
}

final class SchemasListCellModelFactory: ISchemasListCellModelFactory {
    func create() -> [ISchemaCellModel] {
        return [SchemaCellModel(title: "Schema", lastUpdated: "last updated on 25 july 23:19", imageData: Data()), SchemaCellModel(title: "Schema", lastUpdated: "last updated on 25 july 23:19", imageData: Data()), SchemaCellModel(title: "Schema", lastUpdated: "last updated on 25 july 23:19", imageData: Data())]
    }
}
