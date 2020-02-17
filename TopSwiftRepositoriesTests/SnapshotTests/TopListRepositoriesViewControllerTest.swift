//
//  TopListRepositoriesViewControllerTest.swift
//  TopSwiftRepositoriesTests
//
//  Created by Thiago Cavalcante de Oliveira on 16/02/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import Foundation

import Quick
import Nimble
import Nimble_Snapshots

@testable import TopSwiftRepositories

class TopListRepositoriesViewControllerTest: QuickSpec {
    
    override func spec() {
        var topListRepositoriesVC: BaseListRepositoriesViewController!
        describe("TopListRepositoriesViewControllerSnapshotTests") {
            beforeEach {
                topListRepositoriesVC = BaseListRepositoriesViewController()
                topListRepositoriesVC.view.translatesAutoresizingMaskIntoConstraints = false
                
                let window = UIWindow(frame: UIScreen.main.bounds)
                window.makeKeyAndVisible()
                window.rootViewController = topListRepositoriesVC
                
                topListRepositoriesVC.viewDidLoad()
            }
            afterEach {
                topListRepositoriesVC = nil
            }
            
            it("returns the layout") {
                //expect(topListRepositoriesVC.view).to(recordDynamicSizeSnapshot(sizes: sizes))
                expect(topListRepositoriesVC.view).to(haveValidDynamicSizeSnapshot(sizes: sizes))
                
            }
        }
    }
}
