//
//  ListSchemaViewModel.swift
//  ListSchemaViewModel
//
//  Created by Igor Naumenko on 24.07.2021.
//

import Foundation
import RxSwift
import RxCocoa

enum ItemFactory {
    case text
    case drawing
}

protocol IListSchemaViewModelInput {
    func loadItems()
    func openItemFactory(type: ItemFactory)
}

protocol IListSchemaViewModelOutput {
    var itemsObservable: Observable<[ISchemaItemModel]> { get }
    var openItemFactoryObservable: Observable<ItemFactory> { get }
}

protocol IListSchemaViewModel: IItemPreviewModuleOutput {
    var input: IListSchemaViewModelInput { get }
    var output: IListSchemaViewModelOutput { get }
}

final class ListSchemaViewModel: IListSchemaViewModel {
    var input: IListSchemaViewModelInput { return self }
    var output: IListSchemaViewModelOutput { return self }
    
    private let factory: IListSchemaCellModelFactory = ListSchemaCellModelFactory()
    private var currentItems: [ISchemaItemModel] = []
    
    private let itemsSubject = PublishSubject<[ISchemaItemModel]>()
    private let openItemFactorySubject = PublishSubject<ItemFactory>()
}

extension ListSchemaViewModel: IListSchemaViewModelInput {
    func loadItems() {
        let items = factory.create()
        currentItems = items
        itemsSubject.onNext(items)
    }
    
    func openItemFactory(type: ItemFactory) {
        openItemFactorySubject.onNext(type)
    }
}

extension ListSchemaViewModel: IListSchemaViewModelOutput {
    var itemsObservable: Observable<[ISchemaItemModel]> {
        itemsSubject
    }
    
    var openItemFactoryObservable: Observable<ItemFactory> {
        openItemFactorySubject
    }
}

extension ListSchemaViewModel {
    func didReceive(output: ICommonOutput) {
        // TODO: - to adapter/factory
        if let model = output as? IDrawingModel {
            currentItems.append(ImageItem(data: model))
        }
        itemsSubject.onNext(currentItems )
    }
}

extension ListSchemaViewModel {
    private func saveSchema() {
        
    }
}
