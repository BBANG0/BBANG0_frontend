//
//  UserInformation.swift
//  UMC_BBANG0
//
//  Created by 이민섭 on 2022/07/30.
//

import Foundation
import UIKit


class UserInformation{
    
    
    static let shared: UserInformation = UserInformation()
    
    var id: String?
    var password: String?
    var name : String?
    
    
    
    func signInCheck(id: String, password: String ) -> Bool {
        
        if self.id == id , self.password == password {
            return true
        }else {
            return false
        }
        
    }
    
    
    func userDpdate(id: String, password: String , name: String ){
        
        self.id = id
        self.password = password
        self.name = name
        
    }
    
   
    
    
    
}
