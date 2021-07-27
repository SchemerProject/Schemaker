//
//  ItemPreviewViewModel.swift
//  ItemPreviewViewModel
//
//  Created by Igor Naumenko on 27.07.2021.
//

import Foundation
import RxSwift
import RxCocoa

protocol IItemPreviewViewModelInput {
    var currentOutput: PublishRelay<ICommonOutput> { get }
}

protocol IItemPreviewViewModelOutput {
    var updateContentTools: Observable<IToolCurtainModel> { get }
}

protocol IItemPreviewViewModel: SchemeToolCurtainOutput {
    var input: IItemPreviewViewModelInput { get }
    var output: IItemPreviewViewModelOutput { get }
}

final class ItemPreviewViewModel: IItemPreviewViewModel {
    var input: IItemPreviewViewModelInput { return self }
    var output: IItemPreviewViewModelOutput { return self }
    
    let currentOutput = PublishRelay<ICommonOutput>()
    
    private let updateContentToolsSubject = PublishSubject<IToolCurtainModel>()
}

extension ItemPreviewViewModel: IItemPreviewViewModelInput {}

extension ItemPreviewViewModel: IItemPreviewViewModelOutput {
    var updateContentTools: Observable<IToolCurtainModel> {
        updateContentToolsSubject
    }
}

extension ItemPreviewViewModel {
    func modelChanged(model: IToolCurtainModel) {
        updateContentToolsSubject.onNext(model)
    }
}
