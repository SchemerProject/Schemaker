//
//  DrawingOutput.swift
//  DrawingOutput
//
//  Created by Igor Naumenko on 27.07.2021.
//

import UIKit

protocol ICommonOutput {}

struct DrawingOutput: ICommonOutput {
    let points: [[CGPoint]]
    let size: CGSize
}
