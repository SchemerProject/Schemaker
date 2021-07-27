//
//  ToolCurtainCellModelFactory.swift
//  ToolCurtainCellModelFactory
//
//  Created by Igor Naumenko on 25.07.2021.
//

import UIKit

protocol IToolCurtainCellModelBuilder {
    func create() -> IToolCurtainModel
}

final class ToolCurtainCellModelBuilder: IToolCurtainCellModelBuilder {
    func create() -> IToolCurtainModel {
        let colors = createColors()
        let defaultColor = ToolCurtainColorModel(color: .black, isPicked: true, size: Constants.commonSize)
        return ToolCurtainModel(colors: colors, pickedColor: colors.first ?? defaultColor)
    }
}

extension ToolCurtainCellModelBuilder {
    private func createColors() -> [ToolCurtainColorModel] {
        return [ToolCurtainColorModel(color: .black, isPicked: true, size: Constants.commonSize), ToolCurtainColorModel(color: .blue, isPicked: false, size: Constants.commonSize), ToolCurtainColorModel(color: .red, isPicked: false, size: Constants.commonSize), ToolCurtainColorModel(color: .green, isPicked: false, size: Constants.commonSize)]
    }
}

extension ToolCurtainCellModelBuilder {
    private struct Constants {
        static let commonSize = CGSize(width: 55, height: 55)
    }
}
