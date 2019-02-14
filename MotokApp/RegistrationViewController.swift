//
//  RegistrationViewController.swift
//  MotokApp
//
//  Created by 西俣雷斗 on 2019/02/14.
//  Copyright © 2019 西俣雷斗. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        inputStudentNum.delegate = self
       // inputName.delegate = self
        //inputBookDate.delegate = self
        //inputComment.delegate = (self as! UITextViewDelegate)
    }
    
    @IBOutlet weak var inputStudentNum: UITextField!
    
    @IBOutlet weak var inputName: UITextField!
    
    @IBOutlet weak var cameraImage: UIImageView!
    
    @IBAction func cameraButtonAction(_ sender: Any) {
    }
    @IBOutlet weak var inputBookDate: UITextField!
    @IBOutlet weak var inputComment: UITextView!
    @IBAction func doneButtonAction(_ sender: Any) {
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        if let inputKey = textField.text {
            print(inputKey)
        }
        return true
    }
    
}
