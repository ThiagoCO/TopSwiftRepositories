//
//  TopListRepositoriesInteractorTest.swift
//  TopSwiftRepositoriesTests
//
//  Created by Thiago Cavalcante De Oliveira on 17/02/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import XCTest
import Quick
import Nimble
import PromiseKit
@testable import TopSwiftRepositories

class TopListRepositoriesInteractorTest: QuickSpec {
    
    override func spec() {
        super.spec()
        
        describe("TopListRepositoriesInteractorTest") {
            var sut: TopListRepositoriesInteractor!
            var mockWorker: TopListRepositoriesWorkerMock!
            var mockPresenter: TopListRepositoriesPresenterMock!
            
            beforeEach {
                PromiseKit.conf.Q.map = nil
                PromiseKit.conf.Q.return = nil
                
                mockWorker = TopListRepositoriesWorkerMock()
                mockPresenter = TopListRepositoriesPresenterMock()
                
                sut = TopListRepositoriesInteractor(worker: mockWorker)
                sut.presenter = mockPresenter
            }
            
            describe("a request to fetch repositories and populate a list") {
                
                context("successful first request") {
                    
                    it("returns the first page with 30 results") {
                        mockWorker.resultType = .success
                        sut.requestRepositories()
                        
                        expect(sut.repositoryList?.repositories?.count).to(equal(30))
                        expect(sut.nextPage).to(equal(2))
                        expect(mockPresenter.presentScreenLoadingCount).to(equal(1))
                        expect(mockPresenter.hidePaginantionLoadingCount).to(equal(1))
                        expect(mockPresenter.hideScreenLoadingCount).to(equal(1))
                        expect(mockPresenter.presentListRepositoriesCount).to(equal(1))
                    }
                    
                    it("successful fetch more repositories - infinity scroll") {
                        mockWorker.resultType = .success
                        sut.requestRepositories()
                        
                        expect(sut.repositoryList?.repositories?.count).to(equal(30))
                        expect(sut.nextPage).to(equal(2))
                        expect(mockPresenter.presentScreenLoadingCount).to(equal(1))
                        expect(mockPresenter.hidePaginantionLoadingCount).to(equal(1))
                        expect(mockPresenter.hideScreenLoadingCount).to(equal(1))
                        expect(mockPresenter.presentListRepositoriesCount).to(equal(1))
                        
                        sut.fetchMore(index: 29)
                        
                        expect(sut.repositoryList?.repositories?.count).to(equal(60))
                        expect(sut.nextPage).to(equal(3))
                        expect(mockPresenter.presentPaginationLoadingCount).to(equal(1))
                        expect(mockPresenter.hidePaginantionLoadingCount).to(equal(2))
                        expect(mockPresenter.hideScreenLoadingCount).to(equal(2))
                        expect(mockPresenter.presentListRepositoriesCount).to(equal(2))
                    }
                    
                    it("successful pull refresh repositories") {
                        mockWorker.resultType = .success
                        sut.requestRepositories()
                        
                        expect(sut.repositoryList?.repositories?.count).to(equal(30))
                        expect(sut.nextPage).to(equal(2))
                        expect(mockPresenter.presentScreenLoadingCount).to(equal(1))
                        expect(mockPresenter.hidePaginantionLoadingCount).to(equal(1))
                        expect(mockPresenter.hideScreenLoadingCount).to(equal(1))
                        expect(mockPresenter.presentListRepositoriesCount).to(equal(1))
                        
                        sut.requestRepositories()
                        
                        expect(sut.repositoryList?.repositories?.count).to(equal(60))
                        expect(sut.nextPage).to(equal(3))
                        expect(mockPresenter.presentPaginationLoadingCount).to(equal(1))
                        expect(mockPresenter.hidePaginantionLoadingCount).to(equal(2))
                        expect(mockPresenter.hideScreenLoadingCount).to(equal(2))
                        expect(mockPresenter.presentListRepositoriesCount).to(equal(2))
                        
                        sut.refreshRequestRepositories()
                        
                        expect(sut.repositoryList?.repositories?.count).to(equal(30))
                        expect(sut.nextPage).to(equal(2))
                        expect(mockPresenter.presentScreenLoadingCount).to(equal(2))
                        expect(mockPresenter.hidePaginantionLoadingCount).to(equal(3))
                        expect(mockPresenter.hideScreenLoadingCount).to(equal(3))
                        expect(mockPresenter.presentListRepositoriesCount).to(equal(3))
                    }
                    
                    it("returns the first page with 30 results and did select row") {
                        mockWorker.resultType = .success
                        sut.requestRepositories()
                        sut.didSelectRow(index: 1)
                        
                        expect(sut.repositoryList?.repositories?.count).to(equal(30))
                        expect(sut.nextPage).to(equal(2))
                        expect(mockPresenter.presentScreenLoadingCount).to(equal(1))
                        expect(mockPresenter.hidePaginantionLoadingCount).to(equal(1))
                        expect(mockPresenter.hideScreenLoadingCount).to(equal(1))
                        expect(mockPresenter.presentListRepositoriesCount).to(equal(1))
                        expect(mockPresenter.presentPullRequestCount).to(equal(1))
                        expect(sut.selectedItem).verify(sut.selectedItem != nil, FailureMessage(stringValue: "not selected item"))
                    }
                }
                
                context("request repositories error and show error message") {
                    
                    it("return request error") {
                        mockWorker.resultType = .error
                        sut.requestRepositories()
                        
                        expect(sut.repositoryList).to(beNil())
                        expect(sut.nextPage).to(equal(1))
                        expect(mockPresenter.presentScreenLoadingCount).to(equal(1))
                        expect(mockPresenter.hidePaginantionLoadingCount).to(equal(1))
                        expect(mockPresenter.hideScreenLoadingCount).to(equal(1))
                        expect(mockPresenter.presentErrorCount).to(equal(1))
                    }
                }
                
            }
            
            afterEach {
                sut = nil
                mockWorker = nil
                mockPresenter = nil
            }
        }
    }
    
}
