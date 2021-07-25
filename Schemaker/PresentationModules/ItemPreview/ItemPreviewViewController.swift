//
//  ItemPreviewViewController.swift
//  ItemPreviewViewController
//
//  Created by Igor Naumenko on 24.07.2021.
//

import UIKit

final class ItemPreviewViewController: UIViewController {
    
    private let contentView: CommonContentView
    
    init(contentView: CommonContentView) {
        self.contentView = contentView
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        contentView.layer.addShadow(radius: 16, rect: contentView.bounds)
    }
}

extension ItemPreviewViewController {
    private func configureUI() {
        configureBlur()
        configureContent()
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
        let viewModel = SchemeToolCurtainViewModel()
        let curtain = SchemeToolCurtain(viewModel: viewModel)
        curtain.frame.origin.y = view.frame.height - curtain.frame.height + SchemeToolCurtain.PublicConstants.alwaysVisiblePartHeight
        view.addSubview(curtain)
    }
}

extension ItemPreviewViewController {
    private func animateCurtain(isOpen: Bool) {
        
    }
}
