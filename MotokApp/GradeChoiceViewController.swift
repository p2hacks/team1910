//
//  GradeChoiceViewController.swift
//  MotokApp
//
//  Created by 西俣雷斗 on 2019/02/14.
//  Copyright © 2019 西俣雷斗. All rights reserved.
//

import UIKit

class GradeChoiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LectureViewButtonAction(_ sender: Any) {
    }
    
    @IBAction func garde1ButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "goGrade1ViewController", sender: nil)
    }
    
    @IBAction func grade2ButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "goGrade2ViewController", sender: nil)
    }
    
    @IBAction func grade3ButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "goGrade3ViewController", sender: nil)
    }
    
    @IBAction func grade4ButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "goGrade4ViewController", sender: nil)
    }
    
}
