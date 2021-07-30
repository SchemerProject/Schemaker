//
//  ListSchemeTableManager.swift
//  ListSchemeTableManager
//
//  Created by Igor Naumenko on 25.07.2021.
//

import UIKit

protocol IListSchemeTableManager {
    var dataSource: [ISchemaItemModel] { get set }
}

final class ListSchemeTableManager: NSObject, IListSchemeTableManager {
    var dataSource: [ISchemaItemModel] = [] {
        didSet {
            tableView?.reloadData()
        }
    }
    
    private weak var viewModel: IListSchemaViewModel?
    private weak var tableView: UITableView?
    
    init(tableView: UITableView, viewModel: IListSchemaViewModel) {
        self.tableView = tableView
        self.viewModel = viewModel
        super.init()
        configureTableView()
    }
}

extension ListSchemeTableManager: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = dataSource[safe: indexPath.row]
        
        if model is AddItemModel {
            let cell = tableView.dequeue(cellType: ListSchemaAddItemCell.self, indexPath: indexPath)
            
            cell.addTextItem = {
                self.viewModel?.input.openItemFactory(type: .text)
            }
            
            cell.addImageItem = {
                self.viewModel?.input.openItemFactory(type: .drawing)
            }
            
            return cell
        }
        else if let model = model as? ImageItem {
            let cell = tableView.dequeue(cellType: ListSchemaImageCell.self, indexPath: indexPath)
            cell.configure(with: model)
            return cell
        }
        
        fatalError("No cell for model \(String(describing: type(of: model)))")
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension ListSchemeTableManager {
    private func configureTableView() {
        tableView?.delegate = self
        tableView?.dataSource = self
        
        tableView?.register(cellType: ListSchemaImageCell.self)
        tableView?.register(cellType: ListSchemaAddItemCell.self)
    }
}
