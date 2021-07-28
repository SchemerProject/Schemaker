//
//  ItemPreviewModuleOutput.swift
//  ItemPreviewModuleOutput
//
//  Created by Igor Naumenko on 28.07.2021.
//

import Foundation

protocol IItemPreviewModuleOutput: AnyObject {
    func didReceive(output: ICommonOutput)
}
