//
//  ContentView.swift
//  KingfisherSwiftUI
//
//  Created by Matthias Zarzecki on 26.01.21.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    KingFisherImageView(url: "https://ichef.bbci.co.uk/news/976/cpsprodpb/41CF/production/_109474861_angrycat-index-getty3-3.jpg")
      .resizable()
      .cornerRadius(7)
      .aspectRatio(0.78, contentMode: .fit)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
