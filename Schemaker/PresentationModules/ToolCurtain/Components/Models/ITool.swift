//
//  ITool.swift
//  ITool
//
//  Created by Igor Naumenko on 29.07.2021.
//

import Foundation

protocol ITool {}

protocol IListTool: ITool {
    var units: [IToolUnit] { get set }
    var pickedIndex: Int { get set }
}

protocol IPropertyTool: ITool {
    
}
