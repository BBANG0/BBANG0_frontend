//
//  DataBakery.swift
//  BBANG0_IOS_Study
//
//  Created by 이민섭 on 2022/08/16.
//

import Foundation
import UIKit


struct Bakery{
    var id : Int?
    var image : UIImage?
    var name : String?
    var address : String?
}

class BakeryManager {
    static let shared : BakeryManager = BakeryManager()
    var Bakeries : [Bakery] = [a, b, c, d, e]
    
    
}

//data for testing
let a : Bakery = Bakery(id: 1, image: UIImage(named: "storeImage_01"), name: "첫번째 빵집" , address: "매봉로")
let b : Bakery = Bakery(id: 2, image: UIImage(named: "storeImage_02"), name: "두번째 빵집" , address: "동작구")
let c : Bakery = Bakery(id: 3, image: UIImage(named: "storeImage_03"), name: "세번째 빵집" , address: "서울"  )
let d : Bakery = Bakery(id: 4, image: UIImage(named: "storeImage_01"), name: "네번째 빵집" , address: "한국"  )
let e : Bakery = Bakery(id: 5, image: UIImage(named: "storeImage_02"), name: "다섯번째 빵집" , address: "지구")

