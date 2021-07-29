//
//  SchemeToolCurtainViewModel.swift
//  SchemeToolCurtainViewModel
//
//  Created by Igor Naumenko on 25.07.2021.
//

import Foundation
import RxSwift
import RxCocoa

protocol ISchemeToolCurtainViewModelInput {
    func update(pickedToolIndex: Int, pickedUnitIndex: Int)
}

protocol ISchemeToolCurtainViewModelOutput {
    var curtainModelObservable: Observable<[ITool]> { get }
}

protocol ISchemeToolCurtainViewModel: AnyObject {
    var input: ISchemeToolCurtainViewModelInput { get }
    var output: ISchemeToolCurtainViewModelOutput { get }
}

final class SchemeToolCurtainViewModel: ISchemeToolCurtainViewModel {
    var input: ISchemeToolCurtainViewModelInput { return self }
    var output: ISchemeToolCurtainViewModelOutput { return self }
    
    private weak var moduleOutput: SchemeToolCurtainOutput?
    
    private var currentTools: [ITool]
    private let builder: IToolCurtainCellModelBuilder
    private lazy var curtainModelRelay = BehaviorRelay<[ITool]>(value: currentTools)
    private let disposeBag = DisposeBag()
    
    init(input: ISchemeToolCurtainInput, moduleOutput: SchemeToolCurtainOutput? = nil) {
        self.moduleOutput = moduleOutput
        builder = ToolCurtainCellModelBuilder(curtainType: input.curtainType)
        currentTools = builder.create()
        bind()
    }
}

extension SchemeToolCurtainViewModel: ISchemeToolCurtainViewModelInput {
    func update(pickedToolIndex: Int, pickedUnitIndex: Int) {
        let updatedTools = builder.recreate(with: currentTools, pickedToolIndex: pickedToolIndex, pickedUnitIndex: pickedUnitIndex)
        currentTools = updatedTools
        curtainModelRelay.accept(currentTools)
    }
}

extension SchemeToolCurtainViewModel: ISchemeToolCurtainViewModelOutput {
    var curtainModelObservable: Observable<[ITool]> {
        curtainModelRelay.asObservable()
    }
}

extension SchemeToolCurtainViewModel {
    private func bind() {
        curtainModelRelay.subscribe(onNext: { [weak self] model in
            guard let self = self else { return }
            let output = self.builder.buildOutputModel(tools: self.currentTools)
            self.moduleOutput?.modelChanged(model: output)
        })
            .disposed(by: disposeBag)
    }
}
