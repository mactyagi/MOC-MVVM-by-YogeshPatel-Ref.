//
//  ProductTableViewCell.swift
//  MOC MVVM
//
//  Created by Manu on 29/07/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productBackgroundView: UIView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productCategoryLabel: UILabel!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    var product: Product?{
        didSet{
            productDetailConfiguration()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        productBackgroundView.clipsToBounds = false
        productBackgroundView.layer.cornerRadius = 15
        productImageView.layer.cornerRadius = 10
        self.productBackgroundView.backgroundColor = .systemGray6
    }
    func productDetailConfiguration(){
        guard let product else { return }
        productTitleLabel.text = product.title
        productCategoryLabel.text = product.category
        productDescriptionLabel.text = product.description
        priceLabel.text = "$\(product.price)"
        rateButton.setTitle("\(product.rating.rate)", for: .normal)
        productImageView.setImage(with: product.image)
    }
    
}
