//
//  Grade1ViewController.swift
//  MotokApp
//
//  Created by 西俣雷斗 on 2019/02/14.
//  Copyright © 2019 西俣雷斗. All rights reserved.
//

import UIKit

class Grade1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func processingButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "goFreshmanBooks", sender: nil)
    }
    
    @IBAction func SenkeidaisuuButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "goFreshmanBooks", sender: nil)
    }
    
    @IBAction func KaisekiButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "goFreshmanBooks", sender: nil)
    }
    
    @IBAction func KikigaironButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "goFreshmanBooks", sender: nil)
    }
    
    @IBAction func LiteracyButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "goFreshmanBooks", sender: nil)
    }
}
