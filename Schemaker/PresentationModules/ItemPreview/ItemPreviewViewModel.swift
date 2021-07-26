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
    
}

protocol IItemPreviewViewModel {
    var input: IItemPreviewViewModelInput { get }
    var output: IItemPreviewViewModelOutput { get }
}

final class ItemPreviewViewModel: IItemPreviewViewModel {
    var input: IItemPreviewViewModelInput { return self }
    var output: IItemPreviewViewModelOutput { return self }
    
    let currentOutput = PublishRelay<ICommonOutput>()
}

extension ItemPreviewViewModel: IItemPreviewViewModelInput {
    
}

extension ItemPreviewViewModel: IItemPreviewViewModelOutput {
    
}
