//
//  NewsListPresenter.swift
//  KeywordNews
//
//  Created by SooRin Kim on 2022/06/01.
//

import UIKit

protocol NewsListProtocol: AnyObject {
    func setupNavigationBar()
    func setupLayout()
    func endRefreshing()
    func moveToNewsWebViewController(with news: News)
    func reloadTableView()
}

final class NewsListPresenter: NSObject {
    private weak var viewController: NewsListProtocol?
    private let newsSearchManager: NewsSearchManagerProtocol
    
    private var currentKeyword = ""
    // 지금 보여주고 있는 page가 어디인지
    private var currentPage: Int = 0
    // 한 페이지에 최대 몇개까지 보여줄건지
    private let display: Int = 20
    
    private var tags: [String] = ["IT", "개발", "취업", "개발자", "판교", "앱개발", "게임", "강남", "스타트업"]
    
    private var newsList: [News] = []
    
    init(
        viewController: NewsListProtocol,
        newsSearchManager: NewsSearchManagerProtocol = NewsSearchManager()
    ) {
        self.viewController = viewController
        self.newsSearchManager = newsSearchManager
    }
    
    func viewDidLoad() {
        viewController?.setupNavigationBar()
        viewController?.setupLayout()
    }
    
    func didCalledRefresh() {
        requestNewsList(isNeededToReset: true)
    }
}

extension NewsListPresenter: NewsListTableViewHeaderViewDelegate {
    func didSelectTag(_ selectedIndex: Int) {
        currentKeyword = tags[selectedIndex]
        requestNewsList(isNeededToReset: true)
    }
}

extension NewsListPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = newsList[indexPath.row]
        viewController?.moveToNewsWebViewController(with: news)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let currentRow = indexPath.row
        
        // 20개 리스트 중, 17번째에서 미리 다음 페이지를 불러온다. 또한, 마지막 페이지 일때만
        guard (currentRow % 20) == display - 3 && (currentRow / display) == (currentPage - 1) else {
            return
        }
        
        requestNewsList(isNeededToReset: false)
    }
}

extension NewsListPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsListTableViewCell.identifier, for: indexPath) as? NewsListTableViewCell
        
        let news = newsList[indexPath.row]
        cell?.setup(news: news)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: NewsListTableViewHeaderView.identifier
        ) as? NewsListTableViewHeaderView else {
            return UITableViewHeaderFooterView()
        }
        
        header.setup(tags: tags, delegate: self)
        
        return header
    }
}

private extension NewsListPresenter {
    func requestNewsList(isNeededToReset: Bool) {
        if isNeededToReset {
            currentPage = 0
            newsList = []
        }
        
        newsSearchManager.request(
            from: currentKeyword,
            start: (currentPage * display) + 1,
            display: display
        ) { newValue in
            self.newsList += newValue
            self.currentPage += 1
            self.viewController?.reloadTableView()
            self.viewController?.endRefreshing()
        }
    }
}
