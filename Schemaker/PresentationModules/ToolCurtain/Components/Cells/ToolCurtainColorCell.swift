//
//  ToolCurtainColorCell.swift
//  ToolCurtainColorCell
//
//  Created by Igor Naumenko on 25.07.2021.
//

import UIKit

final class ToolCurtainColorCell: UICollectionViewCell {

    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
    }
    
    func configure(with model: ToolCurtainColorModel) {
        backgroundColor = model.color
    }
}

extension ToolCurtainColorCell {
    private func configureUI() {
        layer.cornerRadius = frame.height / 2
        layer.addShadow(radius: 6, rect: layer.bounds)
    }
}
