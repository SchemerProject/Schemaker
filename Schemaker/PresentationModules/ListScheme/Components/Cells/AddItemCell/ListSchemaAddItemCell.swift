//
//  ListSchemaAddItemCell.swift
//  ListSchemaAddItemCell
//
//  Created by Igor Naumenko on 24.07.2021.
//

import UIKit
import RxSwift
import RxCocoa

final class ListSchemaAddItemCell: UITableViewCell {

    @IBOutlet private var addTextItemButton: UIButton!
    @IBOutlet private var addImageItemButton: UIButton!
    
    var addTextItem: (() -> ())?
    var addImageItem: (() -> ())?
    
    private let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
        configureActions()
    }
}

extension ListSchemaAddItemCell {
    private func configureUI() {
        addTextItemButton.layer.cornerRadius = addTextItemButton.frame.height / 2
        addImageItemButton.layer.cornerRadius = addImageItemButton.frame.height / 2
        selectionStyle = .none
    }
    
    private func configureActions() {
        addTextItemButton.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            self.addTextItem?()
        })
            .disposed(by: disposeBag)
        
        addImageItemButton.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            self.addImageItem?()
        })
            .disposed(by: disposeBag)
    }
}
