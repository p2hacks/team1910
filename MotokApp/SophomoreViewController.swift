//
//  SophomoreViewController.swift
//  MotokApp
//
//  Created by 西俣雷斗 on 2019/02/15.
//  Copyright © 2019 西俣雷斗. All rights reserved.
//

import UIKit

class SophomoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label3: UILabel!
    @IBOutlet weak var Label4: UILabel!
    
    @IBOutlet weak var pictureImage1: UIImageView!
    @IBOutlet weak var pictureImage2: UIImageView!
    @IBOutlet weak var pictureImage3: UIImageView!
    @IBOutlet weak var pictureImage4: UIImageView!
    
    
    @IBAction func picture1ChoiceButton(_ sender: Any) {
        performSegue(withIdentifier: "goBookDetail2", sender: nil)
        
    }
    @IBAction func picture2ChoiceButton(_ sender: Any) {
        performSegue(withIdentifier: "goBookDetail2", sender: nil)
    }
    @IBAction func picture3ChoiceButton(_ sender: Any) {
        performSegue(withIdentifier: "goBookDetail2", sender: nil)
    }
    @IBAction func picture4ChoiceButton(_ sender: Any) {
        performSegue(withIdentifier: "goBookDetail2", sender: nil)
    }
    @IBAction func nextPage(_ sender: Any) {
    }
    
    @IBAction func beforePage(_ sender: Any) {
    }
}
