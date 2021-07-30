//
//  DrawingInput.swift
//  DrawingInput
//
//  Created by Igor Naumenko on 28.07.2021.
//

import UIKit

protocol IDrawingModel: ICommonOutput {
    var lineLayers: [DrawingModel.LineLayer] { get set }
    var size: CGSize { get set }
}

struct DrawingModel: IDrawingModel {
    var lineLayers: [LineLayer]
    var size: CGSize = .zero
}

extension DrawingModel {
    struct LineLayer {
        var points: [CGPoint]
        var color: UIColor
    }
}
