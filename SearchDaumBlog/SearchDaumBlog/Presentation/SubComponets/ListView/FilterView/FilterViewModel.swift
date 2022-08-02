//
//  FilterViewModel.swift
//  SearchDaumBlog
//
//  Created by SooRin Kim on 2022/03/01.
//

import RxSwift
import RxCocoa

struct FilterViewModel {
    //FilterView 외부에서 관찰
    let sortButtonTapped = PublishRelay<Void>()
}
