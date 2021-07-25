//
//  ItemPreviewDrawingContentView.swift
//  ItemPreviewDrawingContentView
//
//  Created by Igor Naumenko on 24.07.2021.
//

import UIKit

final class ItemPreviewDrawingContentView: CommonContentView {
    
    private var lineLayers: [[CGPoint]] = []
    
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
        
        setNeedsDisplay()
    }
}
