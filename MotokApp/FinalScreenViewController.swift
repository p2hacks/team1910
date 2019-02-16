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
        performSegue(withIdentifier: "goHomeScreen", sender: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
