//
//  BakeryInfoMaster2ViewController.swift
//  BbangBbang
//
//  Created by 김사랑 on 2022/08/08.
//

import UIKit

class BakeryInfoMasterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backBtnDidTap(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

}
