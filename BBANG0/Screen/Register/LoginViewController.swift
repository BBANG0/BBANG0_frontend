//
//  LoginViewController.swift
//  BbangBbang
//
//  Created by 김사랑 on 2022/07/31.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
    }
    
    @IBAction func loginBtnDidTap(_ sender: UIButton) {
    }

    
    @IBAction func backBtnDidTap(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    private func setupAttribute() {
        // registerButton
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.blue
        
        let attributes = generateButtonAttribute(
            self.loginBtn,
            texts: text1, text2,
            fonts: font1, font2,
            colors: color1, color2)
        
        self.loginBtn.setAttributedTitle(attributes, for: .normal)
    }
}


    //        let storyboard = UIStoryboard(name: "BakeryInfoMaster", bundle: nil )
    //        guard let vc = storyboard.instantiateViewController(withIdentifier: "BakeryInfoMasterVC") as? BakeryInfoMasterViewController else { return }
    //        self.navigationController?.pushViewController(vc, animated: true)
            
    //        let storyboard = UIStoryboard(name: "BakeryInfoMasterVC", bundle: nil)
    //        let vc2 = storyboard.instantiateViewController(withIdentifier: "BakeryInfoMasterVC") as! BakeryInfoMasterVC
    //        self.present(vc2, animated: true, completion: nil)
    //        performSegue(withIdentifier: "goToBakeryInfoMasterStoryboard", sender: self)
    //        self.present(BakeryInfoMasterViewController, animated: true, completion: nil)
        
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if segue.identifier == "goToBakeryInfoMasterStoryboard" {
    //            guard let vc = segue.destination as? BakeryInfoMasterViewController else {return}
    //        }
    //    }
            
            
            
            
    //        let storyboard: UIStoryboard = UIStoryboard(name: "BakeryInfoMasterViewController", bundle: nil)
    //
    //        let BakeryInfoMasterViewController = storyboard.instantiateViewController(withIdentifier: "BakeryInfoMasterViewController") as? BakeryInfoMasterViewController {
    //        // 뷰 컨트롤러를 구성 합니다.
    //
    //            BakeryInfoMasterVC.modalTransitionStyle = .coverVertical
    //            BakeryInfoMasterVC.modalPresentationStyle = .fullScreen
    //
    //            // 뷰 컨트롤러를 나타냅니다.
    //            self.present(BakeryInfoMasterViewController, animated: true, completion: nil)
    //        }

            
    //        {
    //        guard let vc = storyboard?.instantiateViewController(withIdentifier: "BakeryInfoMaster") else {
    //            return
    //        }
            // 화면 전환 시 애니메이션 적용
    //        vc.modalPresentationStyle = UIModalTransitionStyle.coverVertical
            
            // 인자값으로 뷰 컨트롤러 인스턴스 넣고 프리젠트 매소드 호출
    //        self.present(vc, animated: true, completion: nil)
    //    }
        
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
