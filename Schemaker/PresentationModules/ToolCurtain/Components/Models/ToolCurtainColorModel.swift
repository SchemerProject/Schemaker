//
//  ToolCurtainColorModel.swift
//  ToolCurtainColorModel
//
//  Created by Igor Naumenko on 25.07.2021.
//

import UIKit

protocol IToolCurtainColorModel {
    var color: UIColor { get }
    var isPicked: Bool { get }
    var size: CGSize { get }
}

struct ToolCurtainColorModel: IToolCurtainColorModel {
    let color: UIColor
    let isPicked: Bool
    let size: CGSize
}
