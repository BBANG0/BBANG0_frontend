//
//  RegisterViewController.swift
//  BbangBbang
//
//  Created by 김사랑 on 2022/07/31.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 뒤로 가기 버튼에 기능 넣기
    @IBAction func backBtnDidTap(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
}
