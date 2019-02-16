//
//  FreshmanBooksViewController.swift
//  MotokApp
//
//  Created by 西俣雷斗 on 2019/02/15.
//  Copyright © 2019 西俣雷斗. All rights reserved.
//

import UIKit

class FreshmanBooksViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var pictureImage1: UIImageView!
    @IBOutlet weak var pictureImage2: UIImageView!
    @IBOutlet weak var pictureImage3: UIImageView!
    @IBOutlet weak var pictureImage4: UIImageView!
    
    
    @IBAction func picture1ChoiceButton(_ sender: Any) {
        performSegue(withIdentifier: "goBookDetail1", sender: nil)
    }
    @IBAction func picture2ChoiceButton(_ sender: Any) {
        performSegue(withIdentifier: "goBookDetail1", sender: nil)
    }
    
    @IBAction func picture3ChoiceButton(_ sender: Any) {
        performSegue(withIdentifier: "goBookDetail1", sender: nil)
    }
    
    @IBAction func picture4ChoiceButton(_ sender: Any) {
        performSegue(withIdentifier: "goBookDetail1", sender: nil)
    }
}
