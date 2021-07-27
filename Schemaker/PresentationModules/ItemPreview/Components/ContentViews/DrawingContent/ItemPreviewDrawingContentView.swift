//
//  ItemPreviewDrawingContentView.swift
//  ItemPreviewDrawingContentView
//
//  Created by Igor Naumenko on 24.07.2021.
//

import UIKit
import RxSwift
import RxCocoa

final class ItemPreviewDrawingContentView: CommonContentView {
    
    let outputSubject = PublishSubject<ICommonOutput>()
    
    var contentTools: IToolCurtainModel = Constants.defaultToolsContent
    
    private var drawingModel: IDrawingModel
    
    init(drawingInput: IDrawingModel) {
        self.drawingModel = drawingInput
        super.init(frame: .zero)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        // TODO: - Create adapter to map contentTools to better fitting struct for previewContentView
        context.setLineWidth(8)
        context.setLineCap(.round)
        
        for lineLayer in drawingModel.lineLayers {
            context.setStrokeColor(lineLayer.color.cgColor)
            for (index, point) in lineLayer.points.enumerated() {
                if index == 0 {
                    context.move(to: point)
                }
                else {
                    context.addLine(to: point)
                }
            }
            context.strokePath()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        drawingModel.lineLayers.append(DrawingModel.LineLayer(points: [CGPoint](), color: contentTools.pickedColor.color))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        guard let newPoint = touches.first?.location(in: self), var lastLayer = drawingModel.lineLayers.popLast() else { return }
        lastLayer.points.append(newPoint)
        drawingModel.lineLayers.append(lastLayer)
        
        outputSubject.onNext(drawingModel)
        
        setNeedsDisplay()
    }
}

extension ItemPreviewDrawingContentView {
    private struct Constants {
        static let defaultToolsContent = ToolCurtainModel(colors: [], pickedColor: ToolCurtainColorModel(color: .black, isPicked: true, size: .zero))
    }
}
