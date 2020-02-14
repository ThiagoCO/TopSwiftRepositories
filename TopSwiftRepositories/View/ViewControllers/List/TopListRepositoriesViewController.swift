//
//  TopListRepositoriesViewController.swift
//  TopSwiftRepositories
//
//  Created by Thiago Cavalcante De Oliveira on 14/02/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import UIKit

class TopListRepositoriesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel();
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.text = "Hello World!!!"
        label.textColor = .white
        view.addSubview(label)
        
        label.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
    }


}
