//
//  SelectRegionViewModel.swift
//  FindCoronaCenter
//
//  Created by SooRin Kim on 2022/04/12.
//

import Foundation
import Combine

// ObservableObject: Combine에서 제공. 외부에서 바라볼 수 있는 오브젝트
class SelectRegionViewModel: ObservableObject {
    //Published: 어떤 개체를 내보낼지 표현한다.
    @Published var centers = [Center.Sido: [Center]]()
    
    //Rx의 Disposebag에 해당하는 아이
    private var cancellables = Set<AnyCancellable>() //disposeBag
    
    init(centerNetwork: CenterNetwork = CenterNetwork()) {
        centerNetwork.getCenterList()
            .receive(on: DispatchQueue.main) // ViewModel은 View에 뿌져려야 하기 때문에 recieve를 통해 메인쓰레드에 뿌려질 수 있도록 하기.
            .sink( // Rx의 subscribe의 역할
                receiveCompletion: {[weak self] in
                    // 실패 했을경우를 처리
                    guard case .failure(let error) = $0 else { return }
                    print(error.localizedDescription)
                    self?.centers = [Center.Sido: [Center]]() //실패했기 때문에, 빈 딕셔너리로 둔다.
                },
                receiveValue: {[weak self] centers in
                    self?.centers = Dictionary(grouping: centers) {
                        $0.sido
                    }
                }
            )
            .store(in: &cancellables) //disposed(by: disposeBag)
    }
}
