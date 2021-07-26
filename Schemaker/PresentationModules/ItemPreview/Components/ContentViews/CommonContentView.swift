//
//  CommonContentView.swift
//  CommonContentView
//
//  Created by Igor Naumenko on 24.07.2021.
//

import UIKit
import RxSwift
import RxCocoa

typealias CommonContentView = UIView & ICommonContentView

protocol ICommonContentView {
    var outputSubject: PublishSubject<ICommonOutput> { get }
}
