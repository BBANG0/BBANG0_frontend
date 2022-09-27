//
//  SettingViewController.swift
//  BBANG0_IOS_Study
//
//  Created by 이민섭 on 2022/08/23.
//

import UIKit

class SettingViewController: UIViewController {
    
    let tableView : UITableView = {
        let tableview = UITableView()
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNavigationBar()
        tableView.delegate = self
        tableView.dataSource = self

        
        // Do any additional setup after loading the view.
    }
    

    func updateNavigationBar(){
        
        self.navigationItem.title = "설정"
        
    }

}

extension SettingViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    
}
