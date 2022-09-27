//
//  SettingTableViewCell.swift
//  BBANG0_IOS_Study
//
//  Created by 이민섭 on 2022/08/23.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    private let label: UILabel = {

        let label = UILabel()

        label.text = "즐겨찾는 빵집"

        label.textColor = UIColor.black

        return label

    }()


    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setConstraint(){
        self.contentView.addSubview(label)
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive
    }
    
}
