//
//  ListSchemaCellModelFactory.swift
//  ListSchemaCellModelFactory
//
//  Created by Igor Naumenko on 25.07.2021.
//

import Foundation
import UIKit

protocol IListSchemaCellModelFactory {
    func create() -> [ISchemaItemModel]
}

final class ListSchemaCellModelFactory: IListSchemaCellModelFactory {
    func create() -> [ISchemaItemModel] {
        return [AddItemModel(height: nil), ImageItem(height: 600)]
    }
}
