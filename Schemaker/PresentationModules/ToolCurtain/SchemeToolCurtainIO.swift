//
//  SchemeToolCurtainOutput.swift
//  SchemeToolCurtainOutput
//
//  Created by Igor Naumenko on 28.07.2021.
//

import Foundation

protocol SchemeToolCurtainOutput: AnyObject {
    func modelChanged(model: IToolCurtainModel)
}

protocol ISchemeToolCurtainInput {
    var curtainType: ItemFactory { get }
}

struct SchemeToolCurtainInput: ISchemeToolCurtainInput {
    let curtainType: ItemFactory
}
