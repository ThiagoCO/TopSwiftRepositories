//
//  BaseNavigationController.swift
//  TopSwiftRepositories
//
//  Created by Thiago Cavalcante De Oliveira on 14/02/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    public override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationBarAppearence = UINavigationBarAppearance()
        navigationBarAppearence.shadowColor = .clear
        navigationBar.scrollEdgeAppearance = navigationBarAppearence
        navigationBar.isTranslucent = true
        navigationItem.largeTitleDisplayMode = .automatic
    }
}

