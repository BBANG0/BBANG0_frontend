//
//  MasterAddViewController.swift
//  BbangBbang
//
//  Created by 김사랑 on 2022/08/18.
//

import UIKit

class MasterAddViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var arrImageFile: [String] = ["Image1", "Image2", "Image3", "Image4", "Image5"]
    var arrName: [String] = ["크로와상", "촉촉한 우유식빵", "베이글", "호두 호밀빵", "메론빵"]
    var arrPrice: [String] = ["2,000", "1,500", "2,000", "2,000", "1,000"]
    
    let cellReuseIdentifier = "cell"
    let cellSpacingHeight: CGFloat = 5

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "CustomBakeryAddTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomBakeryAddTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    @IBAction func backBtnDidTap(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrName.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomBakeryAddTableViewCell", for: indexPath) as! CustomBakeryAddTableViewCell
        cell.imgView?.image = UIImage(named: arrImageFile[indexPath.row])
        cell.nameLbl?.text = arrName[indexPath.row]
        cell.priceLbl?.text = arrPrice[indexPath.row]
        
        cell.backgroundColor = UIColor.clear
        cell.clipsToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return cellSpacingHeight
        }

        // Make the background color show through
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            return headerView
        }
        
        // method to run when table view cell is tapped
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // note that indexPath.section is used rather than indexPath.row
            print("You tapped cell number \(indexPath.section).")
        }
    
//    public func moveToMasterEdit() {
//        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "MasterEditVC") else {return}
//          self.present(nextVC, animated: true)
//        
//        let VC = MasterAddViewController()
//                    VC.moveToMasterEdit()
//    }
}

//extension MasterAddViewController {
//    public func moveToMasterEdit() {
//        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "MasterEditVC") else {return}
//          self.present(nextVC, animated: true)
//    }
//}



