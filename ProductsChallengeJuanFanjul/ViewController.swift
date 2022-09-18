//
//  ViewController.swift
//  ProductsChallengeJuanFanjul
//
//  Created by Juan Fanjul Bravo on 16/09/2022.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var productsTableView: UITableView!
  
  var productArray =  [Product]()
  var prodService = ProductService()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.productsTableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "productCell")
    productsTableView.delegate = self
    productsTableView.dataSource = self
    
    prodService.loadProductData() { product in
      self.productArray = product
      print(self.productArray.count)
      DispatchQueue.main.async {
          
          self.productsTableView.reloadData()
      }
    }
  }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return productArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let productTableViewCell = productsTableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
    
    productTableViewCell.tilteLabel.text = productArray[indexPath.row].title
    productTableViewCell.productImage.downloaded(from: productArray[indexPath.row].image)
    return productTableViewCell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
      let Storyboard = UIStoryboard(name: "Main", bundle: nil)
      let detailsView = Storyboard.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
      
      detailsView.getProdTitle = productArray[indexPath.row].title
      detailsView.getDescription = productArray[indexPath.row].description
      detailsView.getImage = productArray[indexPath.row].image.description
      
      self.navigationController?.pushViewController(detailsView, animated: true)
  }
  
  
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

