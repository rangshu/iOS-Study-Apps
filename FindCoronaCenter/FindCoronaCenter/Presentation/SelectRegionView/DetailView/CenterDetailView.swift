//
//  CenterDetailView.swift
//  FindCoronaCenter
//
//  Created by SooRin Kim on 2022/04/17.
//

import SwiftUI
import MapKit

struct CenterDetailView: View {
    var center: Center
    
    var body: some View {
        VStack {
            MapView(coordination: center.coordinate)
                .ignoresSafeArea(edges: .all)
                .frame(maxWidth: .infinity,maxHeight: .infinity)
            CenterRow(center: center)
        }
        .navigationTitle(center.facilityName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CenterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let center0 = Center(id: 0, sido: .서울특별시, facilityName: "송파구청 앞", address: "서울특별시 송파구 오금로", lat: "37.373737", lng: "126.373737", centerType: .central, phoneNumber: "010-0000-0000")
        CenterDetailView(center: center0)
    }
}
