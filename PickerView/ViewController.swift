//
//  ViewController.swift
//  PickerView
//
//  Created by Kim Jae Hyeon on 2021/08/13.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let MAX_ARRAY_NUM = 6
    let PICKER_VIEW_COLUNM = 1
    let PICKER_VIEW_HEIGHT:CGFloat=80
    var imageArray = [UIImage?]()
    var imageFileName = ["IMG_8381.JPG", "IMG_8382.JPG", "IMG_8394.JPG","IMG_8395.JPG", "4B3AC2AA-141D-4B51-B2F0-66179943C0BE_1_105_c.jpeg", "C0D07804-9290-47C5-951C-34F0AEF94F44_1_105_c.jpeg"]
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0 ..< MAX_ARRAY_NUM{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUNM
    }
    func pickerView(_pickerView: UIPickerView, rowHeightForComponent component:Int)->CGFloat{
        return PICKER_VIEW_HEIGHT
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    /*func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageFileName[row]
    }*/
    
    func pickerView(_pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?)->UIView{
        let imageView = UIImageView(image:imageArray[row])
        imageView.frame = CGRect(x:0,y:0,width:100, height:150)
        
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
    }
}

