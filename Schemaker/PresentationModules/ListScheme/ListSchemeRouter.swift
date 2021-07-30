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
    private weak var previewOutput: IItemPreviewModuleOutput?
    
    init(controller: UIViewController, previewOutput: IItemPreviewModuleOutput) {
        self.controller = controller
        self.previewOutput = previewOutput
    }
}

extension ListSchemeRouter: IListSchemeRouter {
    func openNewItemPreview(type: ItemFactory) {
        let viewModel = ItemPreviewViewModel(model: DrawingModel(lineLayers: []), moduleOutput: previewOutput)
        let viewController = ItemPreviewViewController(viewModel: viewModel)
        viewController.modalPresentationStyle = .overCurrentContext
        controller?.present(viewController, animated: true, completion: nil)
    }
}
