//
//  CustomBakeryAddTableViewCell.swift
//  BbangBbang
//
//  Created by 김사랑 on 2022/08/16.
//

import UIKit

class CustomBakeryAddTableViewCell: UITableViewCell {
    
    var count: Int = 0

    @IBOutlet weak var boarderView: UIView!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var priceLbl: UILabel!
    @IBOutlet var moveEditBtn: UIButton!
    @IBOutlet var deleteCellBtn: UIButton!
    @IBOutlet weak var borderLineView: UIView!
    @IBOutlet weak var countBorderView: UIView!
    
    @IBOutlet weak var numLbl: UILabel!
        
    override func layoutSubviews() {
        
        super.layoutSubviews()

        self.boarderView?.layer.cornerRadius = 6
        self.boarderView?.layer.borderWidth = 1
        self.boarderView?.layer.borderColor = UIColor.myCustomColor?.cgColor
        self.boarderView?.backgroundColor = .white
        
        self.countBorderView?.layer.cornerRadius = 11
        self.countBorderView?.layer.borderWidth = 1
        self.countBorderView?.layer.borderColor = UIColor.myCustomColor?.cgColor
        self.countBorderView?.backgroundColor = .white
        
        self.numLbl?.text = "0"

        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
//    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
//        if let cell = sender as? UITableViewCell {
//            let i = self.tableView.indexPath(for: cell)!.row
//            if segue.identifier == "toRestaurant" {
//                let vc = segue.destination as! RestaurantViewController
//                vc.data = currentResponse[i] as NSDictionary
//            }
//        }
//    }
    
    
    @IBAction func subBtnDidTap(_ sender: UIButton) {
        if count > 0 {
            count -= 1
            numLbl.text = String(count)
        }
    }
    
    @IBAction func addBtnDidTap(_ sender: UIButton) {
        count += 1
        numLbl.text = String(count)
    }

    @IBAction func moveEditBtnDidTap(_ sender: UIButton) {
        
    }
    
    
    //        addBtn.setTitle("+", for: .normal)
    //        addBtn.frame = CGRect(x: 20, y: 400, width: 30, height: 30)
    //        addBtn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
    //        addBtn.layer.borderWidth = 1
                    
    //        addBtn.addTarget(self, action: #selector(actionAdd(_:)), for: .touchUpInside)
            
    //        subBtn.setTitle("-", for: .normal)
    //        subBtn.frame = CGRect(x: 240, y: 400, width: 30, height: 30)
    //        subBtn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
    //        subBtn.layer.borderWidth = 1
            
    //        subBtn.addTarget(self, action: #selector(actionSub(_:)), for: .touchUpInside)
        
    //        view.addSubview(addBtn)
    //        view.addSubview(subBtn)
    //        view.addSubview(numLabel)
            
    //        numOfBbangField.leftViewMode = UITextField.ViewMode.always
    //        numOfBbangField.leftView = addBtn
    //
    //        numOfBbangField.rightViewMode = UITextField.ViewMode.always
    //        numOfBbangField.rightView = subBtn
            
    //        addBtn.numLabel.transform = CGAffineTransformMakeScale(-1.0, 1.0);
    
}
