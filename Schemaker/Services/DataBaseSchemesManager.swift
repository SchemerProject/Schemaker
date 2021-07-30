//
//  DataBaseSchemesManager.swift
//  DataBaseSchemesManager
//
//  Created by Igor Naumenko on 31.07.2021.
//

import Foundation
import RealmSwift

protocol IDataBaseSchemesManager {
    func save(scheme: Scheme)
    func retrieveSchemes() -> [Scheme]
}

final class DataBaseSchemesManager: IDataBaseSchemesManager {
    private let realm = try? Realm()
    
    func save(scheme: Scheme) {
        try? realm?.write {
            realm?.add(scheme)
        }
    }
    
    func retrieveSchemes() -> [Scheme] {
        guard let results = realm?.objects(Scheme.self) else { return [] }
        return Array(results)
    }
}
