//
//  ListSchemeRouter.swift
//  ListSchemeRouter
//
//  Created by Igor Naumenko on 25.07.2021.
//

import UIKit

protocol IListSchemeRouter {
    func openNewItemPreview(type: ItemFactory)
}

final class ListSchemeRouter {
    
    private weak var controller: UIViewController?
    
    init(controller: UIViewController) {
        self.controller = controller
    }
}

extension ListSchemeRouter: IListSchemeRouter {
    func openNewItemPreview(type: ItemFactory) {
        let contentView = ItemPreviewDrawingContentView(lineLayers: [])
        let viewModel = ItemPreviewViewModel()
        let viewController = ItemPreviewViewController(contentView: contentView, viewModel: viewModel)
        viewController.modalPresentationStyle = .overCurrentContext
        controller?.present(viewController, animated: true, completion: nil)
    }
}
