//
//  ToolUnitConfigurable.swift
//  ToolUnitConfigurable
//
//  Created by Igor Naumenko on 29.07.2021.
//

import UIKit

typealias ToolUnitConfigurableCell = UICollectionViewCell & IToolUnitConfigurable

protocol IToolUnitConfigurable {
    func configure(with model: IToolUnit)
}
