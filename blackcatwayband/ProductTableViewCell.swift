//
//  ProductTableViewCell.swift
//  blackcatwayband
//
//  Created by 張俊傑 on 2021/2/4.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    var i = 0
    @IBAction func minusHandler(_ sender: UIButton) {
        i -= 1
        if i <= 0{
            productAmount.text = "0"
        }else if i >= 5{
            productAmount.text = "5"
        }else{
            productAmount.text = "\(i)"
        }
    }
    @IBAction func plusHandler(_ sender: UIButton) {
        i += 1
        if i >= 5{
            productAmount.text = "5"
        }else if i <= 0{
            productAmount.text = "0"
        }else{
            productAmount.text = "\(i)"
        }
    }
    @IBOutlet weak var productAmount: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
