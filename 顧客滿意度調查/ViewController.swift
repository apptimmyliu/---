//
//  ViewController.swift
//  顧客滿意度調查
//
//  Created by Timmy on 2023/9/12.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var ageSlider: UISlider!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var foodServeSlider: UISlider!
    @IBOutlet weak var foodServeLabel: UILabel!
    @IBOutlet weak var serveSlider: UISlider!
    @IBOutlet weak var serveLabel: UILabel!
    @IBOutlet weak var cleanSlider: UISlider!
    @IBOutlet weak var cleanLabel: UILabel!
    @IBOutlet weak var comeBackSwitch: UISwitch!
    @IBOutlet weak var comeBackLabel: UILabel!
    @IBOutlet weak var goodPersonTextField: UITextField!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    //  定義SegmentedControl值判斷是男性還女性
    var genderIndex : Int = 0
    
    //  定義年齡
    var age : Int = 0
    
    //  評分餐點滿意度
    var foodServe : Int = 0
    
    //  評分服務態度
    var serve : Int = 0
    
    //   評分環境清潔度
    var clean : Int = 0
    
    //  寫出一個func可以讓上面變數產生出他們相對的值
    //  設置初始值
    func customerValue() {
        age = Int(ageSlider.value)
        ageLabel.text = "\(age)"
        
        foodServe = Int(foodServeSlider.value)
        foodServeLabel.text = "\(foodServe)"
        
        serve = Int(serveSlider.value)
        serveLabel.text = "\(serve)"
        
        clean = Int(cleanSlider.value)
        cleanLabel.text = "\(clean)"
        
        //   判斷是男性還女性
        genderIndex = genderSegmentedControl.selectedSegmentIndex
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func genderChange(_ sender: Any) {
        genderIndex = genderSegmentedControl.selectedSegmentIndex
        
    }
    
    @IBAction func ageChangeSlider(_ sender: UISlider) {
        customerValue()
    }
    
    @IBAction func comeBackSwitch(_ sender: UISwitch) {
        //如果開關打開的話，顯示是
        if sender.isOn {
            comeBackLabel.text = "是"
        } else {
            //如果開關是關的話，顯示否
            comeBackLabel.text = "否"
        }
    }
    
    @IBAction func sentButton(_ sender: Any) {
        customerValue()
        
        //        判斷Index是0還是1
        genderIndex = genderSegmentedControl.selectedSegmentIndex
        
        //        算出Slider的值總和
        let customertotal = foodServe + serve + clean
        
        //      如果評分>11，genderIndex的值為0時
        if customertotal > 11 , genderIndex == 0 {
            welcomeLabel.text = "謝謝\(String(nameTextField.text!))先生的肯定！歡迎您再來用餐。"
        } //如果11<=評分>=7 ,genderIndex的值為0時
        else if customertotal <= 11 ,  customertotal >= 7 , genderIndex == 0 {
            welcomeLabel.text = "謝謝\(String(nameTextField.text!))先生的評價我們會儘速改進我們的缺點。"
        }
        //如果評分<7，genderIndex的值為0時
        else if customertotal < 7 , genderIndex == 0 {
            welcomeLabel.text = "不好意思讓\(String(nameTextField.text!)))先生有不愉快的用餐體驗，我們會好好反省。希望我們的改變您看得見。"
        }
        else if customertotal > 11 , genderIndex == 1 {
            welcomeLabel.text = "謝謝\(String(nameTextField.text!))小姐的肯定！期待您再來用餐。"
        }//如果11<=評分>=7,genderIndex得直為1時
        else if customertotal <= 11, customertotal >= 7, genderIndex == 1 {
            welcomeLabel.text = "謝謝\(String(nameTextField.text!))小姐的評價我們會儘速改進我們的缺點，歡迎您再來用餐。"
        } //如果評分<7,genderIndex得直為1時
        else if customertotal < 7 , genderIndex == 1 {
            welcomeLabel.text = "不好意思讓\(String(nameTextField.text!))小姐有不愉快的用餐體驗，希望我們的改變您看得見。"
        }
    }
    @IBAction func reset(_ sender: Any) {
        nameTextField.text = ""
        goodPersonTextField.text = ""
        
        //     slider為0
        
        ageSlider.value = 0
        foodServeSlider.value = 0
        serveSlider.value = 0
        cleanSlider.value = 0
        //    text顯示為0
        ageLabel.text = "0"
        serveLabel.text = "0"
        foodServeLabel.text = "0"
        cleanLabel.text = "0"
        welcomeLabel.text = "歡迎您再度光臨！"
    }
}

