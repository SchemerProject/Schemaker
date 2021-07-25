//
//  ToolCurtainColorCellModelFactory.swift
//  ToolCurtainColorCellModelFactory
//
//  Created by Igor Naumenko on 25.07.2021.
//

import UIKit

protocol IToolCurtainColorCellModelFactory {
    func create() -> [ToolCurtainColorModel]
}

final class ToolCurtainColorCellModelFactory: IToolCurtainColorCellModelFactory {
    func create() -> [ToolCurtainColorModel] {
        let commonSize = CGSize(width: 55, height: 55)
        return [ToolCurtainColorModel(color: .black, size: commonSize), ToolCurtainColorModel(color: .blue, size: commonSize), ToolCurtainColorModel(color: .red, size: commonSize), ToolCurtainColorModel(color: .green, size: commonSize)]
    }
}
