//
//  MapViewController.swift
//  BBANG0_IOS_Study
//
//  Created by 이민섭 on 2022/08/04.
//

//네이버 지도 띄우기 


import UIKit
import NMapsMap


class MapViewController: UIViewController {
    //일단 추가
    var currentIndex: CGFloat = 0
    var isOneStepPaging = true


    @IBOutlet weak var mapView: NMFNaverMapView!
    
    @IBOutlet weak var locationButton: UIButton!
    
    
    @IBAction func settingButtonTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "SettingViewController", bundle: nil )
        guard let vc = storyboard.instantiateViewController(withIdentifier: "SettingViewController") as? SettingViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    var cellId : String  = "BakeryCollectionViewCell"
    //bakeryCollectionView를 프로퍼티로 가지고 있음
    var bakerCollectionView: BakeryCollectionView!
    
    
    var buttonconstraintUP: NSLayoutConstraint?
    var buttonconstraintDOWN: NSLayoutConstraint?
    

    var searchButton : UIButton = {
        
        let aButton = UIButton()
        aButton.backgroundColor = UIColor(named: "OrangeButtonColor")
        aButton.setTitle("내 주변 탐색", for: .normal)
        aButton.setTitleColor(.white, for: .normal)
        aButton.layer.cornerRadius = 16
        aButton.translatesAutoresizingMaskIntoConstraints = false
        return aButton
        
    }()
    
    var deleteButton : UIButton = {
        
        let aButton = UIButton()
        aButton.setImage(UIImage(named: "up_arrow_btn"), for: .normal)
        aButton.setImage(UIImage(named: "down_arrow_btn"), for: .selected)
        
        aButton.translatesAutoresizingMaskIntoConstraints = false
       return aButton
    }()
    
    @objc func searchButtonTapped(_ sender: UIButton) {
        //버튼을 누르면 정해진 위치로 초기화 하고, 데이터 초기화
        
        if bakerCollectionView == nil {
            // bakeryCollectionView 가 없으면 초기화
            // 가장 처음에 searchButton 눌렸을때
            
            bakerCollectionView = newBakeryCollectionView()
            
            buttonconstraintUP = searchButton.bottomAnchor.constraint(equalTo: self.bakerCollectionView!.topAnchor, constant: -22)
            
            buttonconstraintDOWN?.isActive = false
            buttonconstraintUP?.isActive = true
            
            searchButton.updateConstraints()
            
            deleteButton.isSelected = true
            
        }else {
            
            guard let isBakeryListShowing : Bool = buttonconstraintUP?.isActive else{
                return
            }
            
            if isBakeryListShowing { // collection view 보여지고 있는 상태
                
                print("데이터 리로드")
                // 데이터 리로딩
                
            }else { // collection view가 있지만 보여지지만 않고 있는 상태
                
                buttonconstraintDOWN?.isActive = false
                buttonconstraintUP?.isActive = true
                
                bakerCollectionView.activatePopUPConstraints()
                deleteButton.isSelected = true
                
                
            }
            
            
        }
            
    
    }
    
    
    @objc func deleteButtonTapped(_ sender: UIButton) {
        // 위로 올리거나 열려 있는 상태로 누르면 없애기
        
        if bakerCollectionView == nil {
            // bakeryCollectionView 가 없으면 초기화
            
            bakerCollectionView = newBakeryCollectionView()
            
            buttonconstraintUP = searchButton.bottomAnchor.constraint(equalTo: self.bakerCollectionView!.topAnchor, constant: -22)
            
            buttonconstraintDOWN?.isActive = false
            buttonconstraintUP?.isActive = true
            

            deleteButton.isSelected = true
            
        }else {
            
            guard let isBakeryListShowing : Bool = buttonconstraintUP?.isActive else{
                return
            }
            
            if isBakeryListShowing { // collection view 보여지고 있는 상태
                
                buttonconstraintDOWN?.isActive = true
                buttonconstraintUP?.isActive = false
                deleteButton.isSelected = false
                bakerCollectionView.activateCloseConstraints()
                
                
    
                
            }else { // collection view가 있지만 보여지지만 않고 있는 상태
                
                buttonconstraintDOWN?.isActive = false
                buttonconstraintUP?.isActive = true
                deleteButton.isSelected = true
                bakerCollectionView.activatePopUPConstraints()
                
            }
            
        }
            
    
    }
    
    func newBakeryCollectionView() -> BakeryCollectionView {
        
        let bakeryCollectionView = BakeryCollectionView(viewController: self)
        self.view.addSubview(bakeryCollectionView)
        
        bakeryCollectionView.activatePopUPConstraints()

        return bakeryCollectionView
    }
    
    //위치 관리 객체
    private let locationManager = NMFLocationManager.sharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.showLocationButton = false
        self.mapView.showCompass = false
        self.mapView.showZoomControls = false
        
        locationManager?.add(self)
        
        setbuttonsConstraint()
        setSearchButton()
        updateNavigationBarItem()
    }
    
    func updateNavigationBarItem(){
        
        self.navigationItem.backBarButtonItem?.tintColor = .black
        self.navigationItem.backButtonTitle = ""
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        locationManager?.remove(self)
    
    }
    
 
    func setBakeryMarker(){

        let marker = NMFMarker()
        marker.position = NMGLatLng(lat: 37.4766, lng: 126.9816)
        marker.mapView = self.mapView.mapView
        
    }
    

    func setbuttonsConstraint(){
        
        buttonconstraintDOWN = searchButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -82)
        
        
    }
    
    
    func setSearchButton(){
        
        self.view.addSubview(searchButton)

        searchButton.widthAnchor.constraint(equalToConstant: 127).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        buttonconstraintDOWN?.isActive = true
        searchButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        searchButton.addTarget(self, action: #selector(self.searchButtonTapped) , for: .touchUpInside)
        
        
        //없애기 버튼
        self.view.addSubview(deleteButton)
        
        deleteButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: 32).isActive = true

        
        deleteButton.centerYAnchor.constraint(equalTo: searchButton.centerYAnchor).isActive = true
        deleteButton.leadingAnchor.constraint(equalTo: searchButton.trailingAnchor, constant: 76).isActive = true
    
        deleteButton.addTarget(self, action: #selector(self.deleteButtonTapped), for: .touchUpInside)
        
    }
    
    
    

}


extension MapViewController:  NMFLocationManagerDelegate{

}

extension MapViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return BakeryManager.shared.Bakeries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("데아타솟 델리겟?")
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "BakeryCollectionViewCell" ,
            for: indexPath) as? BakeryCollectionViewCell else {
            return BakeryCollectionViewCell()
        }
        
        let bakery : Bakery = BakeryManager.shared.Bakeries[indexPath.item]

        cell.bakeryImage.image = bakery.image
        cell.bakeryName.text = bakery.name
        cell.bakeryAddress.text = bakery.address

        cell.backgroundColor = .white
        
        print("오에")
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return  CGSize(width: collectionView.frame.width-30, height: collectionView.frame.height-10)
    
    
    }
    
    
}


extension MapViewController : UIScrollViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
//        // item의 사이즈와 item 간의 간격 사이즈를 구해서 하나의 item 크기로 설정.
//        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
//
//        // targetContentOff을 이용하여 x좌표가 얼마나 이동했는지 확인
//        // 이동한 x좌표 값과 item의 크기를 비교하여 몇 페이징이 될 것인지 값 설정
//        var offset = targetContentOffset.pointee
//        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
//        var roundedIndex = round(index)
//
//        // scrollView, targetContentOffset의 좌표 값으로 스크롤 방향을 알 수 있다.
//        // index를 반올림하여 사용하면 item의 절반 사이즈만큼 스크롤을 해야 페이징이 된다.
//        // 스크로로 방향을 체크하여 올림,내림을 사용하면 좀 더 자연스러운 페이징 효과를 낼 수 있다.
//        if scrollView.contentOffset.x > targetContentOffset.pointee.x {
//            roundedIndex = floor(index)
//        } else if scrollView.contentOffset.x < targetContentOffset.pointee.x {
//            roundedIndex = ceil(index)
//        } else {
//            roundedIndex = round(index)
//        }
//
//        if isOneStepPaging {
//            if currentIndex > roundedIndex {
//                currentIndex -= 1
//                roundedIndex = currentIndex
//            } else if currentIndex < roundedIndex {
//                currentIndex += 1
//                roundedIndex = currentIndex
//            }
//        }
//
//        // 위 코드를 통해 페이징 될 좌표값을 targetContentOffset에 대입하면 된다.
//        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
//        targetContentOffset.pointee = offset
//
//
    }
}



