//
//  ToolCurtainModel.swift
//  ToolCurtainModel
//
//  Created by Igor Naumenko on 28.07.2021.
//

import Foundation

protocol IToolCurtainModel {
    var colors: [IToolCurtainColorModel] { get set }
    var pickedColor: IToolCurtainColorModel { get set }
}

struct ToolCurtainModel: IToolCurtainModel {
    var colors: [IToolCurtainColorModel]
    var pickedColor: IToolCurtainColorModel
}
