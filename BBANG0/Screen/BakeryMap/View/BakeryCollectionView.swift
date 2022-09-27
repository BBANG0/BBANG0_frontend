//
//  BakeryCollectionView.swift
//  BBANG0_IOS_Study
//
//  Created by 이민섭 on 2022/08/15.
//

import UIKit

class BakeryCollectionView: UICollectionView  {

    
    var viewController: MapViewController!
    
    var upConsArray : [NSLayoutConstraint] = []
    var dwonConsArray : [NSLayoutConstraint] = []
    
    init(viewController: MapViewController) {
        
        self.viewController = viewController
        let layout =  UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20       // 로우 간격
        layout.minimumInteritemSpacing = .zero  // 컬럼 간격
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.delegate = viewController
        self.dataSource = viewController
        
        self.register(BakeryCollectionViewCell.self, forCellWithReuseIdentifier: "BakeryCollectionViewCell")
        self.backgroundColor = .clear
        self.isPagingEnabled = false
//      self.decelerationRate = UIScrollView.DecelerationRate.fast
        
        
        translatesAutoresizingMaskIntoConstraints = false
        let width : CGFloat = self.viewController.view.bounds.width
        let heigth : CGFloat = width * 0.62
        
        widthAnchor.constraint(equalToConstant: width).isActive = true
        heightAnchor.constraint(equalToConstant: heigth).isActive = true
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
    
    func activatePopUPConstraints() {
        
        NSLayoutConstraint.deactivate(dwonConsArray)
        
        let view = viewController.view!
        
        let bottomConst = bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -48)
        let leadingConst = leadingAnchor.constraint(equalTo: view.leadingAnchor)
        
        let trailingConst =  trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        upConsArray = [bottomConst, leadingConst, trailingConst]
        NSLayoutConstraint.activate(upConsArray)
        
        contentInsetAdjustmentBehavior = .always
        
    }

    func activateCloseConstraints() {
        
        
        let view = viewController.view!
        
        NSLayoutConstraint.deactivate(upConsArray)
        
        let bottomConst = topAnchor.constraint(equalTo: view.bottomAnchor)
        
        dwonConsArray = [bottomConst]
        
        NSLayoutConstraint.activate(dwonConsArray)
        
        
    }
    
    
    
    
    

    

}

