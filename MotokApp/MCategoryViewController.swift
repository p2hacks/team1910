//
//  MCategoryViewController.swift
//  MotokApp
//
//  Created by 西俣雷斗 on 2019/02/14.
//  Copyright © 2019 西俣雷斗. All rights reserved.
//

import UIKit

class MCategoryViewController: UIViewController {
    //AppDelegateの参照
    var myAp = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func kyoukashoButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "goGradeChoice", sender: nil)
        myAp.selectButton1 = "本/教科書"
    }
    
    @IBAction func othersButtonAction(_ sender: Any) {
        myAp.selectButton1 = "その他"
    }
    
}
