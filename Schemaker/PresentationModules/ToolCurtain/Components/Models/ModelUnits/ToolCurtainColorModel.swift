//
//  ToolCurtainColorModel.swift
//  ToolCurtainColorModel
//
//  Created by Igor Naumenko on 25.07.2021.
//

import UIKit

protocol IToolCurtainColorModel: IToolUnit {
    var color: UIColor { get }
    var isPicked: Bool { get set }
}

struct ToolCurtainColorModel: IToolCurtainColorModel {
    let color: UIColor
    var isPicked: Bool
    let size: CGSize
}
