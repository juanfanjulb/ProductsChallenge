//
//  DetailsViewController.swift
//  ProductsChallengeJuanFanjul
//
//  Created by Juan Fanjul Bravo on 18/09/2022.
//

import UIKit

class DetailsViewController: UIViewController {

  @IBOutlet weak var prodImage: UIImageView!
  @IBOutlet weak var detailTitleLabel: UILabel!
  @IBOutlet weak var detailDescription: UILabel!
  
  var getProdTitle = String()
  var getDescription = String()
  var getImage = String()
  
    override func viewDidLoad() {
        super.viewDidLoad()

      detailTitleLabel.text! = getProdTitle
      detailDescription.text! = getDescription
      prodImage.downloaded(from: getImage)
    }
}


