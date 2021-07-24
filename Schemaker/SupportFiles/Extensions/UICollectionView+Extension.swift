//
//  UICollectionView+Extension.swift
//  UICollectionView+Extension
//
//  Created by Igor Naumenko on 24.07.2021.
//

import UIKit

extension UICollectionView {
    func dequeue<T: UICollectionViewCell>(cellType: T.Type, indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: String(describing: cellType), for: indexPath) as! T
    }
    
    func register<T: UICollectionViewCell>(cellType: T.Type) {
        let name = String(describing: cellType)
        register(UINib(nibName: name, bundle: nil), forCellWithReuseIdentifier: name)
    }
}
