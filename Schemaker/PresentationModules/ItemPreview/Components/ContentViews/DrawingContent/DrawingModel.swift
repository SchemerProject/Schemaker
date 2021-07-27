//
//  DrawingInput.swift
//  DrawingInput
//
//  Created by Igor Naumenko on 28.07.2021.
//

import UIKit

protocol IDrawingModel: ICommonOutput {
    var lineLayers: [DrawingModel.LineLayer] { get set }
}

struct DrawingModel: IDrawingModel {
    var lineLayers: [LineLayer]
}

extension DrawingModel {
    struct LineLayer {
        var points: [CGPoint]
        var color: UIColor
    }
}
