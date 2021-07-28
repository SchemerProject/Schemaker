//
//  ItemPreviewViewController.swift
//  ItemPreviewViewController
//
//  Created by Igor Naumenko on 24.07.2021.
//

import UIKit
import RxSwift
import RxCocoa

final class ItemPreviewViewController: UIViewController {
    
    private var contentView: CommonContentView
    private let viewModel: IItemPreviewViewModel
    private let contentViewBuilder: IContentViewBuilder = ContentViewBuilder()
    
    private let disposeBag = DisposeBag()
    
    init(viewModel: IItemPreviewViewModel) {
        self.contentView = contentViewBuilder.build(output: viewModel.input.currentOutput.value)
        self.viewModel = viewModel
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        contentView.layer.addShadow(radius: 16, rect: contentView.bounds)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.input.sendCurrentOutput()
    }
}

extension ItemPreviewViewController {
    private func configureUI() {
        configureBlur()
        configureContent()
        configureToolCurtain()
    }
    
    private func configureBlur() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemUltraThinMaterialLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        view.addSubview(blurEffectView)
    }
    
    private func configureContent() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentView)
        contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        contentView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -200).isActive = true
        contentView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive = true
    }
    
    private func configureToolCurtain() {
        let viewModel = SchemeToolCurtainViewModel(moduleOutput: viewModel)
        let curtain = SchemeToolCurtain(viewModel: viewModel)
        curtain.frame.origin.y = view.frame.height - curtain.frame.height + SchemeToolCurtain.PublicConstants.alwaysVisiblePartHeight
        view.addSubview(curtain)
    }
    
    private func bind() {
        contentView.outputSubject
            .bind(to: viewModel.input.currentOutput)
            .disposed(by: disposeBag)
    
        viewModel.output.updateContentTools.subscribe(onNext: { [weak self] contentTools in
            guard let self = self else { return }
            self.contentView.contentTools = contentTools
        })
            .disposed(by: disposeBag)
    }
}
