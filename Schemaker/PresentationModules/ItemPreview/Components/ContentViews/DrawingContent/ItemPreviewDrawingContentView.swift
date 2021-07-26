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
    
    private var currentOutput: DrawingOutput {
        return DrawingOutput(points: lineLayers, size: bounds.size)
    }
    
    private var lineLayers: [[CGPoint]]
    
    init(lineLayers: [[CGPoint]]) {
        self.lineLayers = lineLayers
        super.init(frame: .zero)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setStrokeColor(UIColor.blue.cgColor)
        context.setLineWidth(8)
        context.setLineCap(.round)
        
        for lineLayer in lineLayers {
            for (index, point) in lineLayer.enumerated() {
                if index == 0 {
                    context.move(to: point)
                }
                else {
                    context.addLine(to: point)
                }
            }
        }
        
        context.strokePath()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        lineLayers.append([CGPoint]())
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        guard let newPoint = touches.first?.location(in: self), var lastLayer = lineLayers.popLast() else { return }
        lastLayer.append(newPoint)
        lineLayers.append(lastLayer)
        
        outputSubject.onNext(currentOutput)
        
        setNeedsDisplay()
    }
}
