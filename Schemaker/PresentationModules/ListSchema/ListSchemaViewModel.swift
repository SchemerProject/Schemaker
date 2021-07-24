//
//  ListSchemaViewModel.swift
//  ListSchemaViewModel
//
//  Created by Igor Naumenko on 24.07.2021.
//

import Foundation

protocol IListSchemaViewModelInput {
    
}

protocol IListSchemaViewModelOutput {
    
}

protocol IListSchemaViewModel {
    var input: IListSchemaViewModelInput { get }
    var output: IListSchemaViewModelOutput { get }
}

final class ListSchemaViewModel: IListSchemaViewModel {
    var input: IListSchemaViewModelInput { return self }
    var output: IListSchemaViewModelOutput { return self }
}

extension ListSchemaViewModel: IListSchemaViewModelInput {
    
}

extension ListSchemaViewModel: IListSchemaViewModelOutput {
    
}
