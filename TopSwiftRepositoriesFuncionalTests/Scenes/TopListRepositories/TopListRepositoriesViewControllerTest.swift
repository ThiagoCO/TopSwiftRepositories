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
        
        let imageViewLoadingScreen = getCurrentImageScreen()
        guard let tableView = tester().waitForView(withAccessibilityIdentifier: "tableView") as? UITableView else {
            XCTFail("TableView not found")
            return
        }
        
        // validate layout first loading screen
       
            FBSnapshotVerifyView(imageViewLoadingScreen, identifier: "first_screen_loading", overallTolerance: 0.1)
        
        
        //validate layout repository cell
        if let cell = tester().waitForCell(at: IndexPath(item: 0, section: 0), in: tableView) as? RepositoryCell {
            FBSnapshotVerifyView(cell, identifier: "repository_cell")
        }
        
        // validade first page
        tableView.contentOffset.y = 0
        tester().waitForAnimationsToFinish()
        let imageViewFirstScreen = getCurrentImageScreen()
        
        FBSnapshotVerifyView(imageViewFirstScreen, identifier: "first_screen", overallTolerance: 0.1)
        
        
        //validate infinity scroll layout
        tableView.scrollToRow(at: IndexPath(row: tableView.numberOfRows(inSection: 0)-1, section: 0), at: .bottom, animated: true)
        
        tester().waitForAnimationsToFinish()
        let imgFooter = getCurrentImageScreen()
        FBSnapshotVerifyView(imgFooter, identifier: "infinity_loading",overallTolerance: 0.1)
    }
    
    func getCurrentImageScreen() -> UIImageView {
        let image = XCUIScreen.main.screenshot().image
        let imageView = UIImageView(image: image.removeStatusBar())
        return imageView
    }
    
    
}
