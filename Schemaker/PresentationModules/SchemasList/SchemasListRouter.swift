//
//  SchemasListRouter.swift
//  SchemasListRouter
//
//  Created by Igor Naumenko on 24.07.2021.
//

import Foundation
import UIKit

protocol ISchemaListRouter {
    func openSchema()
    func openCreateSchema()
}

final class SchemaListRouter {
    
    private weak var controller: UIViewController?
    
    init(controller: UIViewController) {
        self.controller = controller
    }
}

extension SchemaListRouter: ISchemaListRouter {
    func openSchema() {
        
    }
    
    func openCreateSchema() {
        
    }
}
