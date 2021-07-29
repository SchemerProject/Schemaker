//
//  SchemeToolsTableManager.swift
//  SchemeToolsTableManager
//
//  Created by Igor Naumenko on 29.07.2021.
//

import UIKit

protocol ISchemeToolsTableManager {
    var dataSource: [ITool] { get set }
}

final class SchemeToolsTableManager: NSObject, ISchemeToolsTableManager {
    var dataSource: [ITool] = [] {
        didSet {
            tableView?.reloadData()
        }
    }
    
    private weak var tableView: UITableView?
    private weak var viewModel: ISchemeToolCurtainViewModel?
    
    init(tableView: UITableView, viewModel: ISchemeToolCurtainViewModel) {
        self.viewModel = viewModel
        self.tableView = tableView
    }
}

extension SchemeToolsTableManager: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = dataSource[safe: indexPath.row]
        
        if let model = model as? IListTool {
            let cell = tableView.dequeue(cellType: ToolListCell.self, indexPath: indexPath)
            cell.configure(with: model.units, viewModel: viewModel, row: indexPath.row)
            return cell
        }
        
        fatalError("No such cell for model \(String(describing: type(of: model)))")
    }
}
