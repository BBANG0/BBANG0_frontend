import UIKit
class BakeryInfoViewController: UIViewController{
    
    //properties
    @IBOutlet weak var bakeryInfoCollectionView: UICollectionView!
    
    //Lifecycle
    override func viewDidLoad() {
        print("여기까지 ")
        super.viewDidLoad()
        setupColletionView()
        
        bakeryInfoCollectionView.clipsToBounds = true
        bakeryInfoCollectionView.layer.cornerRadius = 15
        bakeryInfoCollectionView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
    
        //네비게이션바 타이틀 색 변경
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        //back button  커스텀
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.topItem?.title = ""
       
    }
    
    //Actions
    
    
    
    //Helpers
    private func setupColletionView(){
        bakeryInfoCollectionView.delegate = self
        bakeryInfoCollectionView.dataSource = self
        
        //등록
        bakeryInfoCollectionView.register(UINib(nibName: "BakeryInfoCollectionViewCell", bundle: nil),
                                      forCellWithReuseIdentifier: BakeryInfoCollectionViewCell.identifier)
        
        bakeryInfoCollectionView.register(UINib(nibName: "BakeryBreadCollectionViewCell", bundle: nil),
                                      forCellWithReuseIdentifier: BakeryBreadCollectionViewCell.identifier)
        
        bakeryInfoCollectionView.register(UINib(nibName: "BakeryMidCollectionViewCell", bundle: nil),
                                      forCellWithReuseIdentifier: BakeryMidCollectionViewCell.identifier)
        
        bakeryInfoCollectionView.register(UINib(nibName: "BakeryReviewCollectionViewCell", bundle: nil),
                                      forCellWithReuseIdentifier: BakeryReviewCollectionViewCell.identifier)
    }
    
}

//UICollectionViewDelegate, UICollectionViewDataSource
extension BakeryInfoViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    //섹션 갯수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    //cell 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        case 1:
            return 6
        case 2:
            return 1
        default:
            return 3
        }
    }
    
    //cell생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = indexPath.section
        switch section{
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BakeryInfoCollectionViewCell.identifier, for: indexPath) as? BakeryInfoCollectionViewCell else{
                fatalError("셀 타입 캐스팅 실패")
            }
            return cell
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BakeryBreadCollectionViewCell.identifier, for: indexPath) as? BakeryBreadCollectionViewCell else{
                fatalError("셀 타입 캐스팅 실패")
            }
            return cell
            
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BakeryMidCollectionViewCell.identifier, for: indexPath) as? BakeryMidCollectionViewCell else{
                fatalError("셀 타입 캐스팅 실패")
            }
            return cell
            
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BakeryReviewCollectionViewCell.identifier, for: indexPath) as? BakeryReviewCollectionViewCell else{
                fatalError("셀 타입 캐스팅 실패")
            }
            return cell
        
        }
        
    }
    
}

extension BakeryInfoViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section = indexPath.section
        switch section{
        case 0:
            return CGSize(
                width: collectionView.frame.width, height: (120))
        case 1:
            let side = CGFloat((collectionView.frame.width / 2) - 23)
            return CGSize(
                width: side,
                height: (197))
        case 2:
            return CGSize(
                width: collectionView.frame.width, height: (70))
        default:
            return CGSize(
                width: collectionView.frame.width, height: (100))
        }
    }
    
    //아이템 사이 좌우 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch section{
        case 0:
            return CGFloat(0)
        case 1:
            return CGFloat(13)
        case 2:
            return CGFloat(0)
        default:
            return CGFloat(0)
        }
    }
    
    //아이템 사이 상하 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch section{
        case 0:
            return CGFloat(0)
        case 1:
            return CGFloat(13)
        case 2:
            return CGFloat(0)
        default:
            return CGFloat(22)
        }
    }
    
}
