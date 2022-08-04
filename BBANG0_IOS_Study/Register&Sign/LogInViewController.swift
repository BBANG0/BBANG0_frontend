//
//  LogInViewController.swift
//  BBANG0_IOS_Study
//
//  Created by 이민섭 on 2022/08/04.
//


//modal 로 signIn viewcontroller 띄우기
/*
 
 @IBAction func LoginButtonDidTap(_ sender: UIButton) {
     //회원가입 정보를 전달받아서, 그것과 textField 데이터가 일치하면
     //로그인이 되어야한다.
     guard let userInfo = self.userInfo else{return}
     if userInfo.email == self.email
         && userInfo.password == self.password{
         
         let vc = storyboard?.instantiateViewController(withIdentifier: "TabbarVC") as! UITabBarController
         vc.modalPresentationStyle = .fullScreen
         
         self.present(vc, animated: true, completion: nil)
         
         
     }else{
         
         
     }
     
 }
 
 */


import UIKit

class LogInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
