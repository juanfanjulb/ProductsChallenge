//
//  PruductService.swift
//  ProductsChallengeJuanFanjul
//
//  Created by Juan Fanjul Bravo on 16/09/2022.
//

import Foundation

public final class ProductService: NSObject {
  
  private var completionHandler: (([Product]) -> Void)?
  
  public func loadProductData(_ completionHandler: @escaping(([Product]) -> Void)) {
    self.completionHandler = completionHandler
    makeDataRequest()
  }
  //http://private-f0eea-mobilegllatam.apiary-mock.com/list
  private func makeDataRequest() {
    guard let urlString = "http://private-f0eea-mobilegllatam.apiary-mock.com/list".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
    guard let url = URL(string: urlString) else {return}
    print(urlString)
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard error == nil, let data = data else {return}

      if let response = try? JSONDecoder().decode([Product].self, from: data) {
        self.completionHandler?(response)
      }
    }.resume()
  }
}
