//
//  Grade3ViewController.swift
//  MotokApp
//
//  Created by 西俣雷斗 on 2019/02/14.
//  Copyright © 2019 西俣雷斗. All rights reserved.
//

import UIKit

class Grade3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func ComingSoonButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "goBooks3View", sender: nil)
        
    }
    
}
