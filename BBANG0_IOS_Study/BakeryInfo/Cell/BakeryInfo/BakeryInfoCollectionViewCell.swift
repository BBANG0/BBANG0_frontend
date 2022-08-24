//
//  BakeryInfoCollectionViewCell.swift
//  BBANG0_IOS_Study
//
//  Created by 정휘진 on 2022/08/18.
//

import UIKit

class BakeryInfoCollectionViewCell: UICollectionViewCell {
    static let identifier = "BakeryInfoCollectionViewCell"

    @IBOutlet weak var bakeryLocationLabel: UILabel!
    
    @IBOutlet weak var bakeryTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
