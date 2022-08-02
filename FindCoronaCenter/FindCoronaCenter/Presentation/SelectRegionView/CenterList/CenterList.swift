//
//  CenterList.swift
//  FindCoronaCenter
//
//  Created by SooRin Kim on 2022/04/17.
//

import SwiftUI

struct CenterList: View {
    var centers = [Center]()
    
    var body: some View {
        List(centers, id: \.id) { center in
            NavigationLink(destination: CenterDetailView(center: center)) {
                CenterRow(center: center)
            }
            .navigationTitle(center.sido.rawValue)
        }
    }
}

struct CenterList_Previews: PreviewProvider {
    static var previews: some View {
        let centers = [
            Center(id: 0, sido: .서울특별시, facilityName: "송파구청 앞", address: "서울특별시 송파구 오금로", lat: "37.373737", lng: "126.373737", centerType: .central, phoneNumber: "010-0000-0000"),
            Center(id: 1, sido: .서울특별시, facilityName: "송파구청 앞", address: "서울특별시 송파구 오금로", lat: "37.373737", lng: "126.373737", centerType: .central, phoneNumber: "010-0000-0000"),
            Center(id: 2, sido: .서울특별시, facilityName: "송파구청 앞", address: "서울특별시 송파구 오금로", lat: "37.373737", lng: "126.373737", centerType: .central, phoneNumber: "010-0000-0000")
            
        ]
        CenterList(centers: centers)
    }
}
