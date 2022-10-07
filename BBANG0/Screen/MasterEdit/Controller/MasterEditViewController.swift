//
//  MasterEdit2ViewController.swift
//  BbangBbang
//
//  Created by 김사랑 on 2022/08/09.
//

import Foundation
import UIKit
import MobileCoreServices
import UniformTypeIdentifiers


class MasterEditViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    var count = 0
    
    @IBOutlet weak var imgView: UIImageView!

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var discountedPriceField: UITextField!
    
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var detailInfoField: UITextField!
    
    @IBOutlet weak var uploadBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        numLabel.text = String(sender.value)
    }
    
    @IBAction func uploadBtnDidTap(_ sender: UIButton) {
    }
    
    @IBAction func backBtnDidTap(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnLoadImageFromCamera(_ sender: UIButton) {
        actionSheet()
    }
    
    func actionSheet() {
        let alert = UIAlertController(title: "이미지 선택하기", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "사진 찍기", style: .default, handler: {(handler) in self.openCamera()}))
        alert.addAction(UIAlertAction(title: "라이브러리에서 선택", style: .default, handler: {(handler) in self.openGallery()}))
        alert.addAction(UIAlertAction(title: "취소하기", style: .default, handler: {(handler) in self.openCamera()}))
        self.present(alert, animated: true, completion: nil)
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let image = UIImagePickerController()
            image.allowsEditing = true
            image.sourceType = .camera
            image.mediaTypes = [kUTTypeImage as String]
            image.delegate = self
            self.present(image, animated: true, completion: nil)
        }
    }
    
    func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let image = UIImagePickerController()
            image.allowsEditing = true
            image.delegate = self
            self.present(image, animated: true, completion: nil)
        }
    }
}

extension MasterEditViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(info)
        
        let data = convertFromUIImageToDict(info)
        
        if let editingImage = data[convertInfoKey(UIImagePickerController.InfoKey.editedImage)] as? UIImage{
            print(editingImage)
            self.imgView.image = editingImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func convertFromUIImageToDict(_ input: [UIImagePickerController.InfoKey : Any]) -> [String : Any] {
        return Dictionary(uniqueKeysWithValues: input.map({key, value in (key.rawValue, value)}))
    }
    
    func convertInfoKey(_ input : UIImagePickerController.InfoKey) -> String{
        return input.rawValue
    }
}


//    @IBOutlet weak var addBtn: UIButton!
//    @IBOutlet weak var subBtn: UIButton!

//    let subBtn = UIButton(type: .system)
//    let addBtn = UIButton(type: .system)

//    @objc func actionAdd(_ sender: UIButton) {
//        count += 1
//        num.text = String(count)
//        num.textColor = .black
//       }
       
//    @objc func actionSub(_ sender: UIButton) {
//        count -= 1
//        num.text = String(count)
//        num.textColor = .black
//       }

//        addBtn.setTitle("+", for: .normal)
//        addBtn.frame = CGRect(x: 20, y: 400, width: 30, height: 30)
//        addBtn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
//        addBtn.layer.borderWidth = 1
                
//        addBtn.addTarget(self, action: #selector(actionAdd(_:)), for: .touchUpInside)
        
//        subBtn.setTitle("-", for: .normal)
//        subBtn.frame = CGRect(x: 240, y: 400, width: 30, height: 30)
//        subBtn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
//        subBtn.layer.borderWidth = 1
        
//        subBtn.addTarget(self, action: #selector(actionSub(_:)), for: .touchUpInside)
    
//        view.addSubview(addBtn)
//        view.addSubview(subBtn)
//        view.addSubview(numLabel)
        
//        numOfBbangField.leftViewMode = UITextField.ViewMode.always
//        numOfBbangField.leftView = addBtn
//
//        numOfBbangField.rightViewMode = UITextField.ViewMode.always
//        numOfBbangField.rightView = subBtn
        
//        addBtn.numLabel.transform = CGAffineTransformMakeScale(-1.0, 1.0);
    
