//
//  KingFisherImageView.swift
//  KingfisherSwiftUI
//
//  Created by Matthias Zarzecki on 26.01.21.
//

import SwiftUI
import struct Kingfisher.KFImage
import struct Kingfisher.AnyModifier

/// Loads an image from the Api with authentication.
@ViewBuilder
func KingFisherImageView(url: String) -> KFImage {
  let modifier = AnyModifier { request in
    var modfiableRequest = request
    modfiableRequest.httpMethod = "GET"
    modfiableRequest.setValue("", forHTTPHeaderField: "Authorization")
    return modfiableRequest
  }
  
  KFImage(
    URL(string: url),
    options: [
      .transition(.fade(0.2)),
      .requestModifier(modifier)
    ]
  )
  .onSuccess { result in
    print("success: \(result)")
  }
  .onFailure { error in
    print("Failed to load image: \(error)")
  }
  .placeholder {
    Image(systemName: "hourglass")
      .font(.system(size: 222))
      .opacity(0.25)
  }
}
