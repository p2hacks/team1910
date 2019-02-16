//
//  RegistCheckViewController.swift
//  MotokApp
//
//  Created by 西俣雷斗 on 2019/02/15.
//  Copyright © 2019 西俣雷斗. All rights reserved.
//

import UIKit
import Firebase

class RegistCheckViewController: UIViewController {

    var ref: DatabaseReference!
    let myAp = UIApplication.shared.delegate as! AppDelegate
    var bookid = ""
    
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
        let myAp = UIApplication.shared.delegate as! AppDelegate
        myAp.adddeleteID = ["deleteid": bookid]
        
        ref.child("本").child("教科書/1学年/解析学").child(bookid).setValue(myAp.addstuNumber)
        ref.child("本").child("教科書/1学年/解析学").child(bookid).updateChildValues(myAp.addcomment)
        ref.child("本").child("教科書/1学年/解析学").child(bookid).updateChildValues(myAp.addpublishday)
        ref.child("本").child("教科書/1学年/解析学").child(bookid).updateChildValues(myAp.adddeleteID)
    }
    
    
    
    
    @IBAction func NoButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "goBackRegistration", sender: nil)
    }
}
