//
//  NewsListPresenterTests.swift
//  KeywordNewsTests
//
//  Created by SooRin Kim on 2022/06/08.
//

import XCTest

@testable import KeywordNews

class NewsListPresenterTests: XCTestCase {
    var sut: NewsListPresenter!
    
    var viewController: MockNewsListViewController!
    var newsSearchManager: MockNewsSearchManager!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockNewsListViewController()
        newsSearchManager = MockNewsSearchManager()
        
        sut = NewsListPresenter(viewController: viewController, newsSearchManager: newsSearchManager)
    }
    
    override func tearDown() {
        sut = nil
        
        newsSearchManager = nil
        viewController = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad가_요청될때() {
        sut.viewDidLoad()
        
        XCTAssert(viewController.isCalledSetupNavigationBar)
        XCTAssert(viewController.isCalledSetupLayout)
    }
    
    func test_didCalledRefresh가_요처될때_request에_실패하면() {
        newsSearchManager.error = NSError() as Error
        
        sut.didCalledRefresh()
        
        XCTAssertFalse(viewController.isCalledReloadTableView)
        XCTAssertFalse(viewController.isCalledEndRefreshing)
    }
    
    func test_didCalledRefresh가_요처될때_request에_성공하면() {
        newsSearchManager.error = nil
        
        sut.didCalledRefresh()
        
        XCTAssertTrue(viewController.isCalledReloadTableView)
        XCTAssertTrue(viewController.isCalledEndRefreshing)
    }
}
