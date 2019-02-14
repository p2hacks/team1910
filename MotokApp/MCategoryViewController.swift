//
//  MCategoryViewController.swift
//  MotokApp
//
//  Created by 西俣雷斗 on 2019/02/14.
//  Copyright © 2019 西俣雷斗. All rights reserved.
//

import UIKit

class MCategoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func kyoukashoButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "goGradeChoice", sender: nil)
        
    }
    
    @IBAction func othersButtonAction(_ sender: Any) {
    }
    
}
