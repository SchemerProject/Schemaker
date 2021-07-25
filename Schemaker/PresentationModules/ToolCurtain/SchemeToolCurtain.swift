//
//  SchemeToolCurtain.swift
//  SchemeToolCurtain
//
//  Created by Igor Naumenko on 25.07.2021.
//

import UIKit
import RxSwift
import RxCocoa

final class SchemeToolCurtain: UIView {
    @IBOutlet private var contentView: UIView!
    @IBOutlet private var collectionView: UICollectionView!
    
    private lazy var colorsCollectionManager: ISchemeToolColorCollectionManager = SchemeToolColorCollectionManager(collectionView: collectionView)
    private let viewModel: ISchemeToolCurtainViewModel
    
    private let disposeBag = DisposeBag()
    
    init(viewModel: ISchemeToolCurtainViewModel) {
        self.viewModel = viewModel
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))
        commonInit()
        bind()
        viewModel.input.loadContent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SchemeToolCurtain {
    private func commonInit() {
        Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
    }
    
    private func bind() {
        viewModel.output.colorsObservable.subscribe(onNext: { [weak self] colorModels in
            guard let self = self else { return }
            self.colorsCollectionManager.dataSource = colorModels
        })
            .disposed(by: disposeBag)
    }
}

extension SchemeToolCurtain {
    struct PublicConstants {
        static let alwaysVisiblePartHeight: CGFloat = 19
    }
}
