//
//  ToolCurtainCellModelFactory.swift
//  ToolCurtainCellModelFactory
//
//  Created by Igor Naumenko on 25.07.2021.
//

import UIKit

protocol IToolCurtainCellModelBuilder {
    func create() -> [ITool]
    func recreate(with tools: [ITool], pickedToolIndex: Int, pickedUnitIndex: Int) -> [ITool]
    func buildOutputModel(tools: [ITool]) -> IToolCurtainModel
}

final class ToolCurtainCellModelBuilder {
    
    private let curtainType: ItemFactory
    
    init(curtainType: ItemFactory) {
        self.curtainType = curtainType
    }
}

extension ToolCurtainCellModelBuilder: IToolCurtainCellModelBuilder {
    func create() -> [ITool] {
        switch curtainType {
        case .text:
            return []
        case .drawing:
            return createDrawingTools()
        }
    }
    
    func recreate(with tools: [ITool], pickedToolIndex: Int, pickedUnitIndex: Int) -> [ITool] {
        guard var listTool = tools[safe: pickedToolIndex] as? IListTool else { return tools }
        listTool.pickedIndex = pickedUnitIndex
        listTool.units = recreateUnits(units: listTool.units, pickedUnitIndex: pickedUnitIndex)
        
        var newTools = tools
        newTools.replaceSubrange(pickedToolIndex...pickedToolIndex, with: [listTool])
        return newTools
    }
    
    func buildOutputModel(tools: [ITool]) -> IToolCurtainModel {
        switch curtainType {
        case .text:
            return ToolTextCurtainModel()
        case .drawing:
            return buildDrawingModel(tools: tools)
        }
    }
}

extension ToolCurtainCellModelBuilder {
    private func buildDrawingModel(tools: [ITool]) -> ToolDrawingCurtainModel {
        var lineColor = UIColor()
        
        for tool in tools {
            if let tool = tool as? IListTool, let value = tool.units[safe: tool.pickedIndex] {
                if let value = value as? ToolCurtainColorModel {
                    lineColor = value.color
                }
            }
        }
        
        return ToolDrawingCurtainModel(lineColor: lineColor)
    }
}

extension ToolCurtainCellModelBuilder {
    private func recreateUnits(units: [IToolUnit], pickedUnitIndex: Int) -> [IToolUnit] {
        var newUnits = [IToolUnit]()
        
        for (index, unit) in units.enumerated() {
            if var unit = unit as? ToolCurtainColorModel {
                unit.isPicked = pickedUnitIndex == index
            }
            newUnits.append(unit)
        }
        
        return newUnits
    }
}

extension ToolCurtainCellModelBuilder {
    private func createDrawingTools() -> [ITool] {
        var tools = [ITool]()
        
        let colorTool = createColorTool()
        tools.append(colorTool)
        
        return tools
    }
    
    private func createColorTool() -> CommonListTool {
        let colors = createColors()
        return CommonListTool(units: colors, pickedIndex: 0)
    }
    
    private func createColors() -> [ToolCurtainColorModel] {
        return [ToolCurtainColorModel(color: .black, isPicked: true, size: Constants.commonSize), ToolCurtainColorModel(color: .blue, isPicked: false, size: Constants.commonSize), ToolCurtainColorModel(color: .red, isPicked: false, size: Constants.commonSize), ToolCurtainColorModel(color: .green, isPicked: false, size: Constants.commonSize)]
    }
}

extension ToolCurtainCellModelBuilder {
    private struct Constants {
        static let commonSize = CGSize(width: 55, height: 55)
    }
}
