//
//  SearchBarViewModel.swift
//  SearchDaumBlog
//
//  Created by SooRin Kim on 2022/03/01.
//

import RxSwift
import RxCocoa

struct SearchBarViewModel {
    let queryText = PublishRelay<String?>()
  
    //SearchBar 버튼 탭 이벤트
    let searchButtonTapped = PublishRelay<Void>()
    
    //SearchBar 외부로 내보낼 이벤트
    let shouldLoadResult: Observable<String>
    
    init() {
        shouldLoadResult = searchButtonTapped
            .withLatestFrom(queryText) {
                return $1 ?? ""
            }
            .filter { !$0.isEmpty }
            .distinctUntilChanged()
    }
}
