//
//  SchemeToolCurtain.swift
//  SchemeToolCurtain
//
//  Created by Igor Naumenko on 25.07.2021.
//

import UIKit
import RxSwift
import RxCocoa

final class SchemeToolCurtain: Curtain {
    @IBOutlet private var contentView: UIView!
    @IBOutlet private var tableView: UITableView!
   
    private lazy var tableManager: ISchemeToolsTableManager = SchemeToolsTableManager(tableView: tableView, viewModel: viewModel)
    private let viewModel: ISchemeToolCurtainViewModel
    
    private let disposeBag = DisposeBag()
    
    init(viewModel: ISchemeToolCurtainViewModel) {
        self.viewModel = viewModel
        super.init(frame: Constants.baseFrame, smallestVisiblePart: PublicConstants.alwaysVisiblePartHeight)
        commonInit()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
    }
}

extension SchemeToolCurtain {
    private func commonInit() {
        Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
    }
    
    private func configureUI() {
        let cornerRadius: CGFloat = 16
        contentView.layer.cornerRadius = cornerRadius
        layer.cornerRadius = cornerRadius
        layer.addShadow(radius: 10, rect: bounds)
    }
    
    private func bind() {
        viewModel.output.curtainModelObservable.subscribe(onNext: { [weak self] toolList in
            guard let self = self else { return }
            self.tableManager.dataSource = toolList
        })
            .disposed(by: disposeBag)
    }
}

extension SchemeToolCurtain {
    struct PublicConstants {
        static let alwaysVisiblePartHeight: CGFloat = 19
    }
    
    private struct Constants {
        static let baseFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200)
    }
}
