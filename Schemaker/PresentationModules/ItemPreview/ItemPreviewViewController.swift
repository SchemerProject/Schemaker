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
}

extension ItemPreviewViewController {
    private func configureUI() {
        contentView.frame.size = CGSize(width: view.frame.width - 32, height: view.frame.height - 150)
        contentView.center = view.center
        view.addSubview(contentView)
    }
}
