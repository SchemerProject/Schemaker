//
//  ToolCurtainColorCell.swift
//  ToolCurtainColorCell
//
//  Created by Igor Naumenko on 25.07.2021.
//

import UIKit

final class ToolCurtainColorCell: ToolUnitConfigurableCell {

    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
    }
    
    func configure(with model: IToolUnit) {
        guard let model = model as? IToolCurtainColorModel else { return }
        backgroundColor = model.color
        layer.borderColor = model.isPicked ? UIColor.blue.cgColor : nil
        layer.borderWidth = model.isPicked ? 2 : 0
    }
}

extension ToolCurtainColorCell {
    private func configureUI() {
        layer.cornerRadius = frame.height / 2
        layer.addShadow(radius: 6, rect: layer.bounds)
    }
}
