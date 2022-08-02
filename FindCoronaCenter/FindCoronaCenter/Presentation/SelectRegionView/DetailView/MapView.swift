//
//  MapView.swift
//  FindCoronaCenter
//
//  Created by SooRin Kim on 2022/04/17.
//

import SwiftUI
import MapKit

struct AnnotationItem: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    var coordination: CLLocationCoordinate2D
    //@State는 View 내부에서 변화하는 상태, 외부의 영향을 받지 않음
    @State private var region = MKCoordinateRegion()
    @State private var annotationItems = [AnnotationItem]()
    
    var body: some View {
        Map(
            //$region은 @State로 설정된 region 변수를 지켜보겠다는 뜻
            coordinateRegion: $region,
            annotationItems: [AnnotationItem(coordinate: coordination)],
            annotationContent: {
                MapMarker(coordinate: $0.coordinate)
            }
        )
        .onAppear {
            setRegion(coordination)
            setAnnotationItems(coordination)
        }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    }
    
    private func setAnnotationItems(_ cooridnate: CLLocationCoordinate2D) {
        annotationItems = [AnnotationItem(coordinate: cooridnate)]
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let center0 = Center(id: 0, sido: .서울특별시, facilityName: "송파구청 앞", address: "서울특별시 송파구 오금로", lat: "37.373737", lng: "126.373737", centerType: .central, phoneNumber: "010-0000-0000")
        MapView(coordination: CLLocationCoordinate2D(
            latitude: CLLocationDegrees(center0.lat) ?? .zero,
            longitude: CLLocationDegrees(center0.lng) ?? .zero)
        )
    }
}
