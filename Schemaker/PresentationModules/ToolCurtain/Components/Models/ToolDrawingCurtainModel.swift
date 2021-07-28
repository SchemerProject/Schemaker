//
//  ToolCurtainModel.swift
//  ToolCurtainModel
//
//  Created by Igor Naumenko on 28.07.2021.
//

import Foundation

protocol IToolCurtainModel {}

struct ToolDrawingCurtainModel: IToolCurtainModel {
    var colors: [IToolCurtainColorModel]
    var pickedColor: IToolCurtainColorModel
}
