//
//  SchemeToolColorCollectionManager.swift
//  SchemeToolColorCollectionManager
//
//  Created by Igor Naumenko on 25.07.2021.
//

import UIKit

protocol ICommonListToolCollectionManager {
    var dataSource: [IToolUnit] { get set }
}

final class CommonListToolCollectionManager<C: ToolUnitConfigurableCell>: NSObject, ICommonListToolCollectionManager, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var dataSource: [IToolUnit] = [] {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    private weak var collectionView: UICollectionView?
    private weak var viewModel: ISchemeToolCurtainViewModel?
    private let toolRow: Int
    
    init(collectionView: UICollectionView, viewModel: ISchemeToolCurtainViewModel?, toolRow: Int) {
        self.collectionView = collectionView
        self.viewModel = viewModel
        self.toolRow = toolRow
        super.init()
        configureCollectionView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let model = dataSource[safe: indexPath.row] else { fatalError("Invalid indexPath \(indexPath)") }
        let cell = collectionView.dequeue(cellType: C.self, indexPath: indexPath)
        cell.configure(with: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel?.input.update(pickedToolIndex: toolRow, pickedUnitIndex: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return dataSource[safe: indexPath.row]?.size ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

extension CommonListToolCollectionManager {
    private func configureCollectionView() {
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        collectionView?.register(cellType: C.self)
        collectionView?.contentInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    }
}
