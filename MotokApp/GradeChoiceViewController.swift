//
//  GradeChoiceViewController.swift
//  MotokApp
//
//  Created by 西俣雷斗 on 2019/02/14.
//  Copyright © 2019 西俣雷斗. All rights reserved.
//

import UIKit

class GradeChoiceViewController: UIViewController {
    var myAp = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LectureViewButtonAction(_ sender: Any) {
    }
    
    @IBAction func garde1ButtonAction(_ sender: Any) {
        myAp.selectButton2 = "1学年"
        performSegue(withIdentifier: "goGrade1ViewController", sender: nil)
    }
    
    @IBAction func grade2ButtonAction(_ sender: Any) {
        myAp.selectButton2 = "2学年"
        performSegue(withIdentifier: "goGrade2ViewController", sender: nil)
    }
    
    @IBAction func grade3ButtonAction(_ sender: Any) {
        myAp.selectButton2 = "3学年"
        performSegue(withIdentifier: "goGrade3ViewController", sender: nil)
    }
    
    @IBAction func grade4ButtonAction(_ sender: Any) {
        myAp.selectButton2 = "4学年"
        performSegue(withIdentifier: "goGrade4ViewController", sender: nil)
    }
    
}
