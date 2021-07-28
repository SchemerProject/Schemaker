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
    var currentOutput: BehaviorRelay<ICommonOutput> { get }
    func sendCurrentOutput()
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
    
    let currentOutput: BehaviorRelay<ICommonOutput>
    
    private let updateContentToolsSubject = PublishSubject<IToolCurtainModel>()
    private weak var moduleOutput: IItemPreviewModuleOutput?
    
    init(model: ICommonOutput, moduleOutput: IItemPreviewModuleOutput? = nil) {
        self.moduleOutput = moduleOutput
        currentOutput = BehaviorRelay<ICommonOutput>(value: model)
    }
}

extension ItemPreviewViewModel: IItemPreviewViewModelInput {
    func sendCurrentOutput() {
        moduleOutput?.didReceive(output: currentOutput.value)
    }
}

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
