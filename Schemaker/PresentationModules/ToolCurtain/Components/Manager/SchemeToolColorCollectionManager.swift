//
//  SchemeToolColorCollectionManager.swift
//  SchemeToolColorCollectionManager
//
//  Created by Igor Naumenko on 25.07.2021.
//

import UIKit

protocol ISchemeToolColorCollectionManager {
    var dataSource: [IToolCurtainColorModel] { get set }
}

final class SchemeToolColorCollectionManager: NSObject, ISchemeToolColorCollectionManager {
    var dataSource: [IToolCurtainColorModel] = [] {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    private weak var collectionView: UICollectionView?
    private weak var viewModel: ISchemeToolCurtainViewModel?
    
    init(collectionView: UICollectionView, viewModel: ISchemeToolCurtainViewModel) {
        self.collectionView = collectionView
        self.viewModel = viewModel
        super.init()
        configureCollectionView()
    }
}

extension SchemeToolColorCollectionManager: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let model = dataSource[safe: indexPath.row] else { fatalError("Invalid indexPath \(indexPath)") }
        let cell = collectionView.dequeue(cellType: ToolCurtainColorCell.self, indexPath: indexPath)
        cell.configure(with: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let pickedColor = dataSource[safe: indexPath.row] else { return }
        viewModel?.input.update(pickedColor: pickedColor)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return dataSource[safe: indexPath.row]?.size ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

extension SchemeToolColorCollectionManager {
    private func configureCollectionView() {
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        collectionView?.register(cellType: ToolCurtainColorCell.self)
        collectionView?.contentInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    }
}
