//
//  ContentToolsBuilder.swift
//  ContentToolsBuilder
//
//  Created by Igor Naumenko on 29.07.2021.
//

import Foundation

protocol IContentToolsBuilder {
    func create(model: IToolCurtainModel) -> IContentToolsInput
}

final class ContentToolsBuilder: IContentToolsBuilder {
    func create(model: IToolCurtainModel) -> IContentToolsInput {
        if let model = model as? ToolDrawingCurtainModel {
            return ContentToolsDrawingInput(color: model.pickedColor.color)
        }
        
        fatalError("Wrong model type \(String(describing: type(of: model)))")
    }
}
