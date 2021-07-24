//
//  SchemasListViewModel.swift
//  SchemasListViewModel
//
//  Created by Igor Naumenko on 24.07.2021.
//

import Foundation
import RxSwift
import RxCocoa

protocol ISchemasListViewModelInput {
    func loadSchemes()
}

protocol ISchemasListViewModelOutput {
    var schemesObservable: Observable<[ISchemaCellModel]> { get }
}

protocol ISchemasListViewModel {
    var input: ISchemasListViewModelInput { get }
    var output: ISchemasListViewModelOutput { get }
}

final class SchemasListViewModel: ISchemasListViewModel {
    var input: ISchemasListViewModelInput { return self }
    var output: ISchemasListViewModelOutput { return self }
    
    private let factory: ISchemasListCellModelFactory = SchemasListCellModelFactory()
    
    private let schemesSubject = PublishSubject<[ISchemaCellModel]>()
}

extension SchemasListViewModel: ISchemasListViewModelInput {
    func loadSchemes() {
        let schemes = factory.create()
        schemesSubject.onNext(schemes)
    }
}

extension SchemasListViewModel: ISchemasListViewModelOutput {
    var schemesObservable: Observable<[ISchemaCellModel]> {
        schemesSubject
    }
}
