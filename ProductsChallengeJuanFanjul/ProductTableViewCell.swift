//
//  ProductTableViewCell.swift
//  ProductsChallengeJuanFanjul
//
//  Created by Juan Fanjul Bravo on 16/09/2022.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
  
  @IBOutlet weak var productImage: UIImageView!
  @IBOutlet weak var tilteLabel: UILabel!
  

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
