//
//  ACategoryViewController.swift
//  MotokApp
//
//  Created by 西俣雷斗 on 2019/02/14.
//  Copyright © 2019 西俣雷斗. All rights reserved.
//

import UIKit

class ACategoryViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func AkyokashoButtonAction(_ sender: Any) {
         performSegue(withIdentifier: "goRegistViewController", sender: nil)
        
    }
    
    @IBAction func AothersButtonAction(_ sender: Any) {
    }
}
