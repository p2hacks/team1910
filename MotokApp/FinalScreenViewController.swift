//
//  FinalScreenViewController.swift
//  MotokApp
//
//  Created by 西俣雷斗 on 2019/02/15.
//  Copyright © 2019 西俣雷斗. All rights reserved.
//

import UIKit

class FinalScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func OkGoHomeButton(_ sender: Any) {
        performSegue(withIdentifier: "goHomeView2", sender: nil)
    }
    
}
