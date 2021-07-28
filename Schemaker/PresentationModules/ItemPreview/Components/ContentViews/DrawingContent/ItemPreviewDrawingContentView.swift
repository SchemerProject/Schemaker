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
    
    private var contentTools: ContentToolsDrawingInput = Constants.defaultToolsContent
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
        drawingModel.lineLayers.append(DrawingModel.LineLayer(points: [CGPoint](), color: contentTools.color))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        guard let newPoint = touches.first?.location(in: self), var lastLayer = drawingModel.lineLayers.popLast() else { return }
        lastLayer.points.append(newPoint)
        drawingModel.lineLayers.append(lastLayer)
        
        outputSubject.onNext(drawingModel)
        
        setNeedsDisplay()
    }
    
    func update(contentTools: IContentToolsInput) {
        guard let contentTools = contentTools as? ContentToolsDrawingInput else { return }
        self.contentTools = contentTools
    }
}

extension ItemPreviewDrawingContentView {
    private struct Constants {
        static let defaultToolsContent = ContentToolsDrawingInput(color: .black)
    }
}
