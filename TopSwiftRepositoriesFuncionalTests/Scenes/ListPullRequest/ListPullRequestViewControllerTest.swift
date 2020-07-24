//
//  ListPullRequestViewController.swift
//  TopSwiftRepositoriesTests
//
//  Created by Thiago Cavalcante De Oliveira on 22/07/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import FBSnapshotTestCase
@testable import TopSwiftRepositories

class ListPullRequestViewControllerTest: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
        //recordMode = true
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testViewControllerFlow() {
        
        guard let tableView = tester().waitForView(withAccessibilityIdentifier: "tableView") as? UITableView else {
            XCTFail("TableView not found")
            return
        }
        
        if let _ = tester().waitForCell(at: IndexPath(item: 0, section: 0), in: tableView) as? RepositoryCell {
            tester().tapRow(at: IndexPath(item: 0, section: 0), in: tableView)
            tester().tapRow(at: IndexPath(item: 0, section: 0), in: tableView)
            
            guard let tableViewPullRequests = tester().waitForView(withAccessibilityIdentifier: "tableViewPullRequest") as? UITableView else {
                XCTFail("TableView not found")
                return
            }
            tableViewPullRequests.contentOffset.y = 0
            tester().waitForAnimationsToFinish()
            if let cell = tester().waitForCell(at: IndexPath(item: 0, section: 0), in: tableViewPullRequests) as? PullRequestCell {
                FBSnapshotVerifyView(getCurrentImageScreen(), identifier: "pull_requests_screen", overallTolerance: 0.1)
                FBSnapshotVerifyView(cell, identifier: "pull_request_cell")
                
                
                
            }
            
        }
    }
    
    func getCurrentImageScreen() -> UIImageView {
        let image = XCUIScreen.main.screenshot().image
        let imageView = UIImageView(image: image.removeStatusBar())
        return imageView
    }
}

