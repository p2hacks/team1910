//
//  RegistCheckViewController.swift
//  MotokApp
//
//  Created by 西俣雷斗 on 2019/02/15.
//  Copyright © 2019 西俣雷斗. All rights reserved.
//

import UIKit

class RegistCheckViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var StudentNumVIew: UILabel!
    @IBOutlet weak var BooksNameView: UILabel!
    @IBOutlet weak var cameraImage2: UIImageView!
    @IBOutlet weak var CommentView: UITextView!
    
    @IBAction func YesButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "goFinalScreen", sender: nil)
    }
    
    @IBAction func NoButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "goBackRegistration", sender: nil)
    }
}
