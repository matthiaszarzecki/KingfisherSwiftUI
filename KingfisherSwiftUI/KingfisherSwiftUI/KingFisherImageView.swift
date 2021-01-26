//
//  KingFisherImageView.swift
//  KingfisherSwiftUI
//
//  Created by Matthias Zarzecki on 26.01.21.
//

import SwiftUI
import struct Kingfisher.KFImage
import struct Kingfisher.AnyModifier

/// Loads an image from the Backen-Api with authentication.
@ViewBuilder
func KingFisherImageView(url: String, renderingMode: SwiftUI.Image.TemplateRenderingMode = .original) -> KFImage {
  /*let modifier = AnyModifier { request in
    var modfiableRequest = request
    modfiableRequest.httpMethod = "GET"
    //modfiableRequest.setValue("\(Api.encodedAuthenticationHeader())", forHTTPHeaderField: "Authorization")
    return modfiableRequest
  }*/
  
  KFImage(
    URL(string: url),
    options: [
      .transition(.fade(0.2)),
      //.requestModifier(modifier)
    ]
  )
  .renderingMode(renderingMode)
  .onSuccess { result in
    //print("success: \(result)")
  }
  .onFailure { error in
    print("Failed to load image: \(error)")
  }
  .placeholder {
    Image("image_loading_error")
      .font(.largeTitle)
      .opacity(0.25)
  }
}
