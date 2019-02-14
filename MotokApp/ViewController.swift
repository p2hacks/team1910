//
//  ViewController.swift
//  MotokApp
//
//  Created by 西俣雷斗 on 2019/02/13.
//  Copyright © 2019 西俣雷斗. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func morauButtonAction(_ sender: Any) {
        //もらう人の画面選択への遷移
        performSegue(withIdentifier: "goMorauCategory", sender: nil)
    }
    
    @IBAction func ageruButtonAction(_ sender: Any) {
        //あげる人の画面選択への遷移
        performSegue(withIdentifier: "goAgeruCategory", sender: nil)
    }
}

