//
//  Grade1ViewController.swift
//  MotokApp
//
//  Created by 西俣雷斗 on 2019/02/14.
//  Copyright © 2019 西俣雷斗. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class Grade1ViewController: UIViewController {
    let myAp = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func processingButtonAction(_ sender: Any) {
        myAp.selectButton3 = "情報表現入門1"
        //getValue()
        performSegue(withIdentifier: "goFreshmanBooks", sender: nil)
    }
    
    @IBAction func SenkeidaisuuButtonAction(_ sender: Any) {
        myAp.selectButton3 = "線型代数学"
        print("\(myAp.selectButton1)/\(myAp.selectButton2)/\(myAp.selectButton3)")
        //getValue()
        performSegue(withIdentifier: "goFreshmanBooks", sender: nil)
    }
    
    @IBAction func KaisekiButtonAction(_ sender: Any) {
        myAp.selectButton3 = "解析学1"
        //getValue()
        performSegue(withIdentifier: "goFreshmanBooks", sender: nil)
    }
    
    @IBAction func KikigaironButtonAction(_ sender: Any) {
        myAp.selectButton3 = "情報機器概論"
        //getValue()
        performSegue(withIdentifier: "goFreshmanBooks", sender: nil)
    }
    
    @IBAction func LiteracyButtonAction(_ sender: Any) {
        myAp.selectButton3 = "情報リテラシー"
        //getValue()
        performSegue(withIdentifier: "goFreshmanBooks", sender: nil)
    }
    
    /*
    //データの取得
    func getValue() {
        //データベースの参照URL
        let ref2 = Database.database().reference()
        
        //Firebaseからデータを取り出す
        let myAp = UIApplication.shared.delegate as! AppDelegate
        //bookIDの取得
        ref2.child("\(myAp.selectButton1)/\(myAp.selectButton2)/\(myAp.selectButton3)").observeSingleEvent(of: .value) { (snap,error) in
            //print(snap)
            let snapData = snap.value as? [String:AnyObject]
            if snapData == nil {
                return
            }
            for (path, _) in snapData! {
                if(path != "ダミー"){
                    //詳細データの取得
                    ref2.child("\(myAp.selectButton1)/\(myAp.selectButton2)/\(myAp.selectButton3)/\(path)").observeSingleEvent(of: .value) { (snap,error) in
                        //print(snap)
                        let snapData = snap.value as? [String:AnyObject]
                        if snapData == nil {
                            return
                        }
                        for (k, v) in snapData! {
                            self.checkKey(k: k, v: v)
                        }
                    }
                }
            }
        }
    }
    
    //キーに応じた配列に代入
    func checkKey(k: String, v: AnyObject){
        let myAp = UIApplication.shared.delegate as! AppDelegate
        if(k == "画像URL"){
            myAp.imageURL.append(v as! String)
            //print(myAp.imageURL)
        } else if(k == "学籍番号") {
            myAp.stuNumber.append(v as! String)
            //print(myAp.stuNumber)
        } else if(k == "出版日") {
            myAp.publishDay.append(v as! String)
            //print(myAp.publishDay)
        }else if(k == "コメント"){
            myAp.comment.append(v as! String)
            //print(myAp.comment)
        }else if(k == "deleteID"){
            myAp.deleteID.append(v as! String)
            //print(myAp.deleteID)

        }
    }*/
    
}
