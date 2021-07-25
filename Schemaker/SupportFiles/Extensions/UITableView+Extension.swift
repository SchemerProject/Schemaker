//
//  UITableView+Extension.swift
//  UITableView+Extension
//
//  Created by Igor Naumenko on 25.07.2021.
//

import UIKit

extension UITableView {
    func dequeue<T: UITableViewCell>(cellType: T.Type, indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: String(describing: cellType), for: indexPath) as! T
    }
    
    func register<T: UITableViewCell>(cellType: T.Type) {
        let name = String(describing: cellType)
        register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: name)
    }
}
