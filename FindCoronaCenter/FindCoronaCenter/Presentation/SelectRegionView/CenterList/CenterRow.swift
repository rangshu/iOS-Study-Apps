//
//  CenterRow.swift
//  FindCoronaCenter
//
//  Created by SooRin Kim on 2022/04/17.
//

import SwiftUI

struct CenterRow: View {
    var center: Center
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(center.facilityName)
                    .font(.headline)
                Text(center.centerType.rawValue)
                    .font(.caption)
                    .foregroundColor(.gray)
                Spacer()
            }
            Text(center.address)
                .font(.footnote)
            
            if let url = URL(string: "tel:" + center.phoneNumber) {
                Link(center.phoneNumber, destination: url)
            }
        }
        .padding()
    }
}

struct CenterRow_Previews: PreviewProvider {
    static var previews: some View {
        let center0 = Center(id: 0, sido: .서울특별시, facilityName: "송파구청 앞", address: "서울특별시 송파구 오금로", lat: "37.373737", lng: "126.373737", centerType: .central, phoneNumber: "010-0000-0000")
        CenterRow(center: center0)
    }
}
