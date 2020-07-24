//
//  ListPullRequestInteractorTest.swift
//  TopSwiftRepositoriesTests
//
//  Created by Thiago Cavalcante De Oliveira on 22/07/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import XCTest
import Quick
import Nimble
import PromiseKit
@testable import TopSwiftRepositories

class ListPullRequestInteractorTest: QuickSpec {
    
    override func spec() {
        super.spec()
        describe("ListPullRequestInteractorTest") {
            var sut: ListPullRequestInteractor!
            var mockWorker: ListPullRequestWorkerMock!
            var mockPresenter: ListPullRequestPresenterMock!
            
            beforeEach {
                PromiseKit.conf.Q.map = nil
                PromiseKit.conf.Q.return = nil
                
                mockWorker = ListPullRequestWorkerMock()
                mockPresenter = ListPullRequestPresenterMock()
                
                sut = ListPullRequestInteractor(worker: mockWorker)
                sut.presenter = mockPresenter
                
            }
            
            describe("a request to fetch pull requests and populate a list") {
                context("Success request") {
                    
                    it("Existing pull requests") {
                        mockWorker.resultType = .success
                        sut.selectedRepository = TopListRepositoriesModel.Repository(name: "TopSwiftRepostiroies", stargazersCount: 1000, description: "Repositories github", forksCount: 1000, owner: TopListRepositoriesModel.Owner(login: "thiagoCO", avatarUrl: ""))
                        sut.getPullRequest()
                        
                        expect(mockPresenter.presentScreenLoadingCount).to(equal(1))
                        expect(mockPresenter.presentPullRequestsCount).to(equal(1))
                        expect(mockPresenter.hideScreenLoadingCount).to(equal(1))
                    }
                    
                    it("Empty pull requests") {
                        mockWorker.resultType = .empty
                        sut.selectedRepository = TopListRepositoriesModel.Repository(name: "TopSwiftRepostiroies", stargazersCount: 1000, description: "Repositories github", forksCount: 1000, owner: TopListRepositoriesModel.Owner(login: "thiagoCO", avatarUrl: ""))
                        sut.getPullRequest()
                        
                        expect(mockPresenter.presentScreenLoadingCount).to(equal(1))
                        expect(mockPresenter.presentErrorCount).to(equal(1))
                        expect(mockPresenter.hideScreenLoadingCount).to(equal(1))
                    }
                }
                
                context("Error Request") {
                    it("Default error request") {
                        mockWorker.resultType = .error
                        sut.selectedRepository = TopListRepositoriesModel.Repository(name: "TopSwiftRepostiroies", stargazersCount: 1000, description: "Repositories github", forksCount: 1000, owner: TopListRepositoriesModel.Owner(login: "thiagoCO", avatarUrl: ""))
                        sut.getPullRequest()
                        
                        expect(mockPresenter.presentScreenLoadingCount).to(equal(1))
                        expect(mockPresenter.presentErrorCount).to(equal(1))
                        expect(mockPresenter.hideScreenLoadingCount).to(equal(1))
                    }
                    
                    it("not existing selected repository") {
                        sut.getPullRequest()
                        expect(mockPresenter.presentErrorCount).to(equal(1))
                    }
                }
            }
        }
        
    }
}
