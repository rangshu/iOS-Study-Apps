//
//  StationDetailViewController.swift
//  SubwayStation
//
//  Created by SooRin Kim on 2022/02/13.
//

import SnapKit
import Alamofire
import UIKit

final class StationDetailViewController: UIViewController {
    private let station: Station
    private var realtimeArrivalList: [StationArrivalDataResponseModel.RealTimeArrival] = []
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(fetchData), for: .valueChanged)
        
        return refreshControl
    }()
    
    @objc func fetchData() {

        let stationName = station.stationName

        let urlString = "http://swopenapi.seoul.go.kr/api/subway/sample/json/realtimeStationArrival/0/5/\(stationName.replacingOccurrences(of: "역", with: ""))"

        AF
            .request(urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
            .responseDecodable(of: StationArrivalDataResponseModel.self) { [weak self] response in
                guard let self = self else { return }
                self.refreshControl.endRefreshing()
                guard case .success(let data) = response.result else { return }
                
                self.realtimeArrivalList = data.realtimeArrivalList
                self.collectionView.reloadData()
            }
            .resume()
        
        refreshControl.endRefreshing()
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: view.frame.width - 32.0, height: 100.0)
        layout.sectionInset = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(StationDetailCollectionViewCell.self, forCellWithReuseIdentifier: "StationDetailCollectionViewCell")
        
        collectionView.dataSource = self
        
        collectionView.refreshControl = refreshControl
        
        return collectionView
    }()
    
    init(station: Station) {
        self.station = station
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = station.stationName
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        fetchData()
    }
}

extension StationDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return realtimeArrivalList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StationDetailCollectionViewCell", for: indexPath) as? StationDetailCollectionViewCell
        else { return UICollectionViewCell() }
        
        let realTimeArrival = realtimeArrivalList[indexPath.row]
        cell.setup(with: realTimeArrival)
        
        return cell
    }
}
