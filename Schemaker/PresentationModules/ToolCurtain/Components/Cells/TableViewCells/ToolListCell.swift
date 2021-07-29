//
//  ToolListCell.swift
//  ToolListCell
//
//  Created by Igor Naumenko on 29.07.2021.
//

import UIKit

final class ToolListCell: UITableViewCell {
    @IBOutlet private var collectionView: UICollectionView!
    private var collectionManager: ICommonListToolCollectionManager?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configure(with model: [IToolUnit], viewModel: ISchemeToolCurtainViewModel?, row: Int) {
        collectionManager = CommonListToolCollectionManager<ToolCurtainColorCell>(collectionView: collectionView, viewModel: viewModel, toolRow: row)
        collectionManager?.dataSource = model
    }
}

extension ToolListCell {
    private func configureUI() {
        selectionStyle = .none
    }
}
