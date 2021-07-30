//
//  ListSchemaImageCell.swift
//  ListSchemaImageCell
//
//  Created by Igor Naumenko on 24.07.2021.
//

import UIKit

final class ListSchemaImageCell: UITableViewCell {
    
    private var contentDrawing: CommonContentView?

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configure(with model: ImageItem) {
        let contentDrawing = ItemPreviewDrawingContentView(drawingInput: model.data)
        contentDrawing.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentDrawing)
        
        contentDrawing.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentDrawing.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentDrawing.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        self.contentDrawing = contentDrawing
    }
}

extension ListSchemaImageCell {
    private func configureUI() {
        selectionStyle = .none
    }
}
