//
//  ItemPreviewTextContentView.swift
//  ItemPreviewTextContentView
//
//  Created by Igor Naumenko on 24.07.2021.
//

import UIKit
import RxSwift
import RxCocoa

final class ItemPreviewTextContentView: CommonContentView {
    var contentTools: IToolCurtainModel = ToolCurtainModel(colors: [], pickedColor: ToolCurtainColorModel(color: .blue, isPicked: true, size: .zero))
    let outputSubject = PublishSubject<ICommonOutput>()
}
