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
    func update(pickedColor: IToolCurtainColorModel)
}

protocol ISchemeToolCurtainViewModelOutput {
    var curtainModelObservable: Observable<IToolCurtainModel> { get }
}

protocol ISchemeToolCurtainViewModel: AnyObject {
    var input: ISchemeToolCurtainViewModelInput { get }
    var output: ISchemeToolCurtainViewModelOutput { get }
}

final class SchemeToolCurtainViewModel: ISchemeToolCurtainViewModel {
    var input: ISchemeToolCurtainViewModelInput { return self }
    var output: ISchemeToolCurtainViewModelOutput { return self }
    
    private weak var moduleOutput: SchemeToolCurtainOutput?
    
    private let builder: IToolCurtainCellModelBuilder = ToolCurtainCellModelBuilder()
    private lazy var curtainModelRelay = BehaviorRelay<IToolCurtainModel>(value: builder.create())
    private let disposeBag = DisposeBag()
    
    init(moduleOutput: SchemeToolCurtainOutput? = nil) {
        self.moduleOutput = moduleOutput
        bind()
    }
}

extension SchemeToolCurtainViewModel: ISchemeToolCurtainViewModelInput {
    func update(pickedColor: IToolCurtainColorModel) {
        guard var newCurtainModel = curtainModelRelay.value as? ToolDrawingCurtainModel else { return }
        newCurtainModel.pickedColor = pickedColor
        newCurtainModel.colors = newCurtainModel.colors.map { ToolCurtainColorModel(color: $0.color, isPicked: $0.color == pickedColor.color, size: $0.size) }
        curtainModelRelay.accept(newCurtainModel)
    }
}

extension SchemeToolCurtainViewModel: ISchemeToolCurtainViewModelOutput {
    var curtainModelObservable: Observable<IToolCurtainModel> {
        curtainModelRelay.asObservable()
    }
}

extension SchemeToolCurtainViewModel {
    private func bind() {
        curtainModelRelay.subscribe(onNext: { [weak self] model in
            guard let self = self else { return }
            self.moduleOutput?.modelChanged(model: model)
        })
            .disposed(by: disposeBag)
    }
}
