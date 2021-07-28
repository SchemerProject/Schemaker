//
//  ContentViewBuilder.swift
//  ContentViewBuilder
//
//  Created by Igor Naumenko on 28.07.2021.
//

import UIKit

protocol IContentViewBuilder {
    func build(output: ICommonOutput) -> CommonContentView
}

final class ContentViewBuilder: IContentViewBuilder {
    func build(output: ICommonOutput) -> CommonContentView {
        if let output = output as? IDrawingModel {
            return ItemPreviewDrawingContentView(drawingInput: output)
        }
        else if let output = output as? TextOutput {
            return ItemPreviewTextContentView()
        }
        
        fatalError("No such previewContentView")
    }
}
