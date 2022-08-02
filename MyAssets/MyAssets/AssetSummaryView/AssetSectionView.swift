//
//  AssetSectionView.swift
//  MyAssets
//
//  Created by SooRin Kim on 2022/01/31.
//

import SwiftUI

struct AssetSectionView: View {
    @ObservedObject var assetSection: Asset
    var body: some View {
        VStack(spacing: 20) {
            AssetSectionHeaderView(title: assetSection.type.title)
            ForEach(assetSection.data) { asset in
                HStack {
                    Text(asset.title)
                        .font(.title)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(asset.amount)
                        .font(.title2)
                        .foregroundColor(.primary)
                }
                Divider()
            }
        }
        .padding()
    }
}

//struct AssetSectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        AssetSectionView(assetSection: <#Asset#>)
//    }
//}
