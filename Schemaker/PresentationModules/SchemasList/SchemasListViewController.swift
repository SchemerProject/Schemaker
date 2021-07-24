//
//  SchemasListViewController.swift
//  SchemasListViewController
//
//  Created by Igor Naumenko on 24.07.2021.
//

import UIKit
import RxSwift
import RxCocoa

final class SchemasListViewController: UIViewController {
    @IBOutlet private var collectionView: UICollectionView!
    
    private lazy var collectionViewManager: ISchemasListCollectionViewManager = SchemasListCollectionViewManager(collectionView: collectionView)
    private let viewModel: ISchemasListViewModel
    
    private let disposeBag = DisposeBag()
    
    init(viewModel: ISchemasListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bind()
        viewModel.input.loadSchemes()
    }
}

extension SchemasListViewController {
    private func bind() {
        viewModel.output.schemesObservable.subscribe(onNext: { [weak self] schemes in
            guard let self = self else { return }
            self.collectionViewManager.dataSource = schemes
        })
            .disposed(by: disposeBag)
    }
    
    private func configureUI() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
