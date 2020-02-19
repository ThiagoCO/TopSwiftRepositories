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
        
        guard let tableView = tester().waitForView(withAccessibilityIdentifier: "tableView") as? UITableView else {
            XCTFail("TableView not found")
            return
        }
        
        // validate layout first loading screen
        tester().waitForView(withAccessibilityIdentifier: "loadingView")
        let imageViewLoadingScreen = getCurrentImageScreen()
        FBSnapshotVerifyView(imageViewLoadingScreen, identifier: "first_screen_loading")
        
        
        //validate layout repository cell
        if let cell = tester().waitForCell(at: IndexPath(item: 0, section: 0), in: tableView) as? RepositoryCell {
            FBSnapshotVerifyView(cell, identifier: "repository_cell")
        }
        
        // validade first page
        tableView.contentOffset.y = 0
        tester().waitForAnimationsToFinish()
        let imageViewFirstScreen = getCurrentImageScreen()
        
        FBSnapshotVerifyView(imageViewFirstScreen, identifier: "first_screen")
        
        //validade pull refresh
        tester().pullToRefreshView(withAccessibilityIdentifier: "tableView", pullDownDuration: .inAboutAHalfSecond)
        tester().waitForAnimationsToFinish()
        FBSnapshotVerifyView(getCurrentImageScreen(), identifier: "pull_to_refresh", overallTolerance: 0.001)
        
        //validade pull refresh
        tester().pullToRefreshView(withAccessibilityIdentifier: "tableView", pullDownDuration: .inAboutAHalfSecond)
        tester().waitForAnimationsToFinish()
        FBSnapshotVerifyView(getCurrentImageScreen(), identifier: "pull_to_refresh", overallTolerance: 0.001)
        
        
        //validate infinity scroll layout
        tableView.scrollToRow(at: IndexPath(row: tableView.numberOfRows(inSection: 0)-1, section: 0), at: .bottom, animated: true)
        
        tester().swipeView(withAccessibilityIdentifier: "tableView", in: .up)
        tester().waitForAnimationsToFinish()
        tester().waitForView(withAccessibilityIdentifier: "loadingView")
        tester().waitForAnimationsToFinish()
        FBSnapshotVerifyView(getCurrentImageScreen(), identifier: "infinity_loading")
    }
    
    func getCurrentImageScreen() -> UIImageView {
        let image = XCUIScreen.main.screenshot().image
        let imageView = UIImageView(image: image.removeStatusBar())
        return imageView
    }
}
