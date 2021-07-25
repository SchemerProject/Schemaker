//
//  ListSchemaViewController.swift
//  ListSchemaViewController
//
//  Created by Igor Naumenko on 24.07.2021.
//

import UIKit
import RxSwift
import RxCocoa

final class ListSchemaViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    
    private lazy var tableManager: IListSchemeTableManager = ListSchemeTableManager(tableView: tableView, viewModel: viewModel)
    private lazy var router: IListSchemeRouter = ListSchemeRouter(controller: self)
    
    private let viewModel: IListSchemaViewModel
    
    private let disposeBag = DisposeBag()
    
    init(viewModel: IListSchemaViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.input.loadItems()
    }
}

extension ListSchemaViewController {
    private func bind() {
        viewModel.output.itemsObservable.subscribe(onNext: { [weak self] items in
            guard let self = self else { return }
            self.tableManager.dataSource = items
        })
            .disposed(by: disposeBag)
    }
}
