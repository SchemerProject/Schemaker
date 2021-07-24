//
//  ViewController.swift
//  Schemaker
//
//  Created by Igor Naumenko on 24.07.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Temporary
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let vm = SchemasListViewModel()
            let vc = SchemasListViewController(viewModel: vm)
            let navigationController = UINavigationController(rootViewController: vc)
            navigationController.modalPresentationStyle = .overFullScreen
            self.present(navigationController, animated: true, completion: nil)
        }
        
    }


}

