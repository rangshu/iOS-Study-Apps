//
//  ContentView.swift
//  NetflixStyleSampleApp
//
//  Created by SooRin Kim on 2022/01/27.
//

import SwiftUI

struct ContentView: View {
    let titles = ["Netfilx Sample App"]
    var body: some View {
        NavigationView {
            List(titles, id: \.self) {
                let netfilxVC = HomeViewControllerRepresentable()
                    .navigationBarHidden(true)
                    .edgesIgnoringSafeArea(.all)
                NavigationLink($0, destination: netfilxVC)
            }
            .navigationTitle("SwiftUI to UIKit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
