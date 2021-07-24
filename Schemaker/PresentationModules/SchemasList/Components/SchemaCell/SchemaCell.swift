//
//  SchemaCell.swift
//  SchemaCell
//
//  Created by Igor Naumenko on 24.07.2021.
//

import UIKit

final class SchemaCell: UICollectionViewCell {
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var lastUpdateDateLabel: UILabel!
    @IBOutlet private var schemaImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.addShadow(radius: 6, rect: bounds)
    }
    
    func configure(with model: SchemaCellModel) {
        titleLabel.text = model.title
        lastUpdateDateLabel.text = model.lastUpdated
        schemaImageView.image = UIImage(data: model.imageData)
    }
}

extension SchemaCell {
    private func configureUI() {
        titleLabel.textColor = .bodyTextColor
        lastUpdateDateLabel.textColor = .gray
        backgroundColor = .white
        layer.cornerRadius = 16
    }
}
