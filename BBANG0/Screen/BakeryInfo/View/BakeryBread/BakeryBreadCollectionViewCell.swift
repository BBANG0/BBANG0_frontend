//
//  BakeryCollectionViewCell.swift
//  BBANG0_IOS_Study
//
//  Created by 정휘진 on 2022/08/11.
//

import UIKit

class BakeryBreadCollectionViewCell: UICollectionViewCell {
    static let identifier = "BakeryBreadCollectionViewCell"

    
    @IBOutlet weak var bakeryBreadImageView: UIImageView!
    
    
    @IBOutlet weak var bakeryBreadNameLabel: UILabel!
    
    @IBOutlet weak var bakeryStockLabel: UILabel!
    
    
    @IBOutlet weak var bakeryOriginalPriceLabel: UILabel!
    
    
    @IBOutlet weak var bakeryDiscountPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        self.layer.cornerRadius = 15.0
//        layer.shadowRadius = 10
//        layer.shadowOpacity = 0.4
//        layer.shadowOffset = CGSize(width:7, height:10)
//        self.clipsToBounds = true
//    }

}
