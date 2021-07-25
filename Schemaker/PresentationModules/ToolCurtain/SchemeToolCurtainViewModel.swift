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
    func loadContent()
}

protocol ISchemeToolCurtainViewModelOutput {
    var colorsObservable: Observable<[ToolCurtainColorModel]> { get }
}

protocol ISchemeToolCurtainViewModel {
    var input: ISchemeToolCurtainViewModelInput { get }
    var output: ISchemeToolCurtainViewModelOutput { get }
}

final class SchemeToolCurtainViewModel: ISchemeToolCurtainViewModel {
    var input: ISchemeToolCurtainViewModelInput { return self }
    var output: ISchemeToolCurtainViewModelOutput { return self }
    
    private let colorFactory: IToolCurtainColorCellModelFactory = ToolCurtainColorCellModelFactory()
    
    private var colorsSubject = PublishSubject<[ToolCurtainColorModel]>()
}

extension SchemeToolCurtainViewModel: ISchemeToolCurtainViewModelInput {
    func loadContent() {
        let colorModels = colorFactory.create()
        colorsSubject.onNext(colorModels)
    }
}

extension SchemeToolCurtainViewModel: ISchemeToolCurtainViewModelOutput {
    var colorsObservable: Observable<[ToolCurtainColorModel]> {
        colorsSubject
    }
}
