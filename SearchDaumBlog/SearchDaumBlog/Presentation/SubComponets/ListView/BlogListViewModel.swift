//
//  BlogListViewModel.swift
//  SearchDaumBlog
//
//  Created by SooRin Kim on 2022/03/01.
//

import RxSwift
import RxCocoa

struct BlogListViewModel {
    let filterViewMdoel = FilterViewModel()
    
    //MainViewController -> BlogListView
    let blogCellData = PublishSubject<[BlogListCellData]>()
    let cellData: Driver<[BlogListCellData]>
    
    init() {
        self.cellData = blogCellData
            .asDriver(onErrorJustReturn: [])
    }
}
