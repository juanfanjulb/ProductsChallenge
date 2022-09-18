//
//  Product.swift
//  ProductsChallengeJuanFanjul
//
//  Created by Juan Fanjul Bravo on 16/09/2022.
//

import Foundation

public struct Product: Decodable {
  let title: String
  let description: String
  let image: URL
  
  enum CodingKeys: String, CodingKey {
      case title
      case description
      case image
  }
}
