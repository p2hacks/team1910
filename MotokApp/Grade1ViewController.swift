//
//  Grade1ViewController.swift
//  MotokApp
//
//  Created by 西俣雷斗 on 2019/02/14.
//  Copyright © 2019 西俣雷斗. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class Grade1ViewController: UIViewController {
    let myAp = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func processingButtonAction(_ sender: Any) {
        myAp.selectButton3 = "情報表現入門1"
        performSegue(withIdentifier: "goFreshmanBooks", sender: nil)
    }
    
    @IBAction func SenkeidaisuuButtonAction(_ sender: Any) {
        myAp.selectButton3 = "線型代数学"
        print("\(myAp.selectButton1)/\(myAp.selectButton2)/\(myAp.selectButton3)")
        performSegue(withIdentifier: "goFreshmanBooks", sender: nil)
    }
    
    @IBAction func KaisekiButtonAction(_ sender: Any) {
        myAp.selectButton3 = "解析学1"
        performSegue(withIdentifier: "goFreshmanBooks", sender: nil)
    }
    
    @IBAction func KikigaironButtonAction(_ sender: Any) {
        myAp.selectButton3 = "情報機器概論"
        performSegue(withIdentifier: "goFreshmanBooks", sender: nil)
    }
    
    @IBAction func LiteracyButtonAction(_ sender: Any) {
        myAp.selectButton3 = "情報リテラシー"
        performSegue(withIdentifier: "goFreshmanBooks", sender: nil)
    }
}
