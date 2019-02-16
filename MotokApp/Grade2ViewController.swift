//
//  Grade2ViewController.swift
//  MotokApp
//
//  Created by 西俣雷斗 on 2019/02/14.
//  Copyright © 2019 西俣雷斗. All rights reserved.
//

import UIKit

class Grade2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func OuyousuugakuButtonAction(_ sender: Any) {
         performSegue(withIdentifier: "goSophopmoreBooks", sender: nil)
    }
    
    @IBAction func DennshikougakuButtonAction(_ sender: Any) {
         performSegue(withIdentifier: "goSophopmoreBooks", sender: nil)
    }
    
    @IBAction func JinnkouchinoukisoButtonAction(_ sender: Any) {
         performSegue(withIdentifier: "goSophopmoreBooks", sender: nil)
    }
    
    @IBAction func NinnchisinnrigakuButtonAction(_ sender: Any) {
         performSegue(withIdentifier: "goSophopmoreBooks", sender: nil)
    }
}
