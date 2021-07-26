//
//  Curtain.swift
//  Curtain
//
//  Created by Igor Naumenko on 26.07.2021.
//

import UIKit
import RxSwift
import RxCocoa

class Curtain: UIView {
    
    private let disposeBag = DisposeBag()
    
    private var lastY: CGFloat
    private let smallestVisiblePart: CGFloat
    
    init(frame: CGRect, smallestVisiblePart: CGFloat) {
        lastY = frame.origin.y
        self.smallestVisiblePart = smallestVisiblePart
        super.init(frame: frame)
        configurePan()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Curtain {
    private func configurePan() {
        let panGestureRecognizer = UIPanGestureRecognizer()
        panGestureRecognizer.rx.event.subscribe(onNext: { [weak self] event in
            guard let self = self else { return }
            
            switch event.state {
            case .possible:
                break
            case .began:
                self.coordinateBeganToChange()
            case .changed:
                self.coordinateChanged(event: event)
            case .ended:
                self.animateToFinalState()
            case .cancelled:
                break
            case .failed:
                break
            @unknown default:
                break
            }
        })
            .disposed(by: disposeBag)
        
        addGestureRecognizer(panGestureRecognizer)
    }
    
    private func coordinateBeganToChange() {
        lastY = frame.origin.y
    }
    
    private func coordinateChanged(event: UIPanGestureRecognizer) {
        guard let superviewHeight = superview?.frame.height else { return }
        
        let location = event.translation(in: self)
        let newY = lastY + location.y
        
        if newY < superviewHeight - frame.height {
            frame.origin.y = superviewHeight - frame.height
        }
        else if newY > superviewHeight - smallestVisiblePart {
            frame.origin.y = superviewHeight - smallestVisiblePart
        }
        else {
            frame.origin.y = newY
        }
    }
}

extension Curtain {
    private func animateToFinalState() {
        guard let superviewHeight = superview?.frame.height else { return }
        
        let isOpen = (frame.origin.y - (superviewHeight - self.frame.height)) < frame.height / 2
        UIView.animate(withDuration: 0.3) {
            self.frame.origin.y = isOpen ? superviewHeight - self.frame.height : superviewHeight - self.smallestVisiblePart
        }
    }
}
