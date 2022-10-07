//
//  BakeryReviewCollectionViewCell.swift
//  BBANG0_IOS_Study
//
//  Created by 정휘진 on 2022/08/18.
//

import UIKit

class BakeryReviewCollectionViewCell: UICollectionViewCell {
    static let identifier = "BakeryReviewCollectionViewCell"
    
    @IBOutlet weak var reviewerNameLabel: UILabel!
    
    @IBOutlet weak var reviewDateLabel: UILabel!
    
    @IBOutlet weak var starStackView: UIStackView!
    
    @IBOutlet weak var reviewContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
