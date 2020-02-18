//
//  TopListRepositoriesViewControllerTest.swift
//  TopSwiftRepositoriesTests
//
//  Created by Thiago Cavalcante de Oliveira on 17/02/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import FBSnapshotTestCase
@testable import TopSwiftRepositories

class TopListRepositoriesViewControllerTest: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
      //recordMode = true

    }
    
    func testViewControllerFlow() {

        guard let viewController = UIApplication.shared.keyWindow?.rootViewController as? BaseNavigationController, let rootView = viewController.view else {
            XCTFail("view controller not foud")
            return
        }
        
        guard let tableView = tester().waitForView(withAccessibilityIdentifier: "tableView") as? UITableView else {
            XCTFail("TableView not found")
            return
        }
        
        //validate layout repository cell
        if let cell = tester().waitForCell(at: IndexPath(item: 0, section: 0), in: tableView) as? RepositoryCell {
            FBSnapshotVerifyView(cell, identifier: "repository_cell")
        }
            
        FBSnapshotVerifyView(tableView, identifier: "first_page")
        
        
        
    }
}
