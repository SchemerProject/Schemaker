//
//  SchemasListCollectionViewManager.swift
//  SchemasListCollectionViewManager
//
//  Created by Igor Naumenko on 24.07.2021.
//

import UIKit

protocol ISchemasListCollectionViewManager {
    var dataSource: [ISchemaCellModel] { get set }
}

final class SchemasListCollectionViewManager: NSObject, ISchemasListCollectionViewManager {
    
    var dataSource: [ISchemaCellModel] = [] {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    private weak var collectionView: UICollectionView?
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        configureCollectionView()
    }
}

extension SchemasListCollectionViewManager: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(cellType: SchemaCell.self, indexPath: indexPath)
        if let model = dataSource[safe: indexPath.row] as? SchemaCellModel {
            cell.configure(with: model)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 32, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}

extension SchemasListCollectionViewManager {
    private func configureCollectionView() {
        collectionView?.register(cellType: SchemaCell.self)
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
}
