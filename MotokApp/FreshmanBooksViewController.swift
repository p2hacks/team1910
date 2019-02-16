//
//  FreshmanBooksViewController.swift
//  MotokApp
//
//  Created by 西俣雷斗 on 2019/02/15.
//  Copyright © 2019 西俣雷斗. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

class FreshmanBooksViewController: UIViewController {
    let myAp = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        imageArray.append(pictureImage1)
        imageArray.append(pictureImage2)
        imageArray.append(pictureImage3)
        imageArray.append(pictureImage4)
        labelArray.append(label1)
        labelArray.append(label2)
        labelArray.append(label3)
        labelArray.append(label4)
        super.viewDidLoad()
        getValue()
    }
    //let myAp = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var pictureImage1: UIImageView!
    @IBOutlet weak var pictureImage2: UIImageView!
    @IBOutlet weak var pictureImage3: UIImageView!
    @IBOutlet weak var pictureImage4: UIImageView!
    var imageArray: Array<UIImageView> = []
    var labelArray: Array<UILabel> = []
    
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
    
    
    //学籍番号と画像の表示
    func showValue(i: Int, pictureImage: UIImageView) {
        labelArray[i].text = myAp.stuNumber[i]
        viewImage(url: myAp.imageURL[i], imageView: pictureImage)
    }
    
    func viewImage(url: String, imageView: UIImageView){
        let storage = Storage.storage()
        let httpsReference = storage.reference(forURL: url)
        
        // Create a reference to the file you want to download
        let islandRef = httpsReference //.child("images/island.jpg")
        
        // Download in memory with a maximum allowed size of 30MB (30 * 1024 * 1024 bytes)
        islandRef.getData(maxSize: 50 * 1024 * 1024) { data, error in
            if let error = error {
                // Uh-oh, an error occurred!
            } else {
                // Data for "images/island.jpg" is returned
                let image = UIImage(data: data!)
                imageView.image = image
            }
        }
    }
    

    //データの取得
    func getValue() {
        //データベースの参照URL
        let ref2 = Database.database().reference()
        //Firebaseからデータを取り出す
        let myAp = UIApplication.shared.delegate as! AppDelegate
        var i = 0
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
                        if(i < 4){
                        self.showValue(i: i, pictureImage: self.imageArray[i])
                        i += 1
                        }
                    }
                }
            }
            
            //self.showValue(i: 0, pictureImage: self.imageArray)
            //self.showValue(i: 1, pictureImage: self.pictureImage2)
            //self.showValue(i: 2, pictureImage: self.pictureImage3)
            //self.showValue(i: 3, pictureImage: self.pictureImage4)
        }
    }
    
    //キーに応じた配列に代入
    func checkKey(k: String, v: AnyObject){
        //let myAp = UIApplication.shared.delegate as! AppDelegate
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
    }
}

