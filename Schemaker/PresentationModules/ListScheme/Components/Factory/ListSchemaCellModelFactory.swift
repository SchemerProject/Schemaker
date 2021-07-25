//
//  ListSchemaCellModelFactory.swift
//  ListSchemaCellModelFactory
//
//  Created by Igor Naumenko on 25.07.2021.
//

import Foundation

protocol IListSchemaCellModelFactory {
    func create() -> [ISchemaItemModel]
}

final class ListSchemaCellModelFactory: IListSchemaCellModelFactory {
    func create() -> [ISchemaItemModel] {
        return [AddItemModel()]
    }
}
