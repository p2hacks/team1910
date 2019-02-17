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

//Freshmanの名前は許してほしい
class FreshmanBooksViewController: UIViewController {
    let myAp = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
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
        myAp.nextCount = 0

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
        myAp.i = 0
        performSegue(withIdentifier: "goBookDetail1", sender: nil)
    }
    
    @IBAction func picture2ChoiceButton(_ sender: Any) {
        myAp.i = 1
        performSegue(withIdentifier: "goBookDetail1", sender: nil)
    }
    
    @IBAction func picture3ChoiceButton(_ sender: Any) {
        myAp.i = 2
        performSegue(withIdentifier: "goBookDetail1", sender: nil)
    }
    
    @IBAction func picture4ChoiceButton(_ sender: Any) {
        myAp.i = 3
        performSegue(withIdentifier: "goBookDetail1", sender: nil)
    }
    
    @IBAction func nextBooksButtonAction(_ sender: Any) {
        nextValue()
    }
    
    @IBAction func backBooksButtonAction(_ sender: Any) {
        beforeValue()
    }
    
    //学籍番号と画像の表示
    func showValue(i: Int, pictureImage: UIImageView) {
        print(myAp.stuNumber[i])
        labelArray[i%4].text = myAp.stuNumber[i]
        viewImage(url: myAp.imageURL[i], imageView: pictureImage)
    }
    
    //写真の表示
    func viewImage(url: String, imageView: UIImageView){
        let storage = Storage.storage()
        let httpsReference = storage.reference(forURL: url)
        
        // Create a reference to the file you want to download
        let islandRef = httpsReference //.child("images/island.jpg")
        
        // Download in memory with a maximum allowed size of 30MB (30 * 1024 * 1024 bytes)
        islandRef.getData(maxSize: 30 * 1024 * 1024) { data, error in
            if let error = error {
                // Uh-oh, an error occurred!
            } else {
                // Data for "images/island.jpg" is returned
                let image = UIImage(data: data!)
                imageView.image = image
            }
        }
    }
    //データの取得 データが４つ未満だとエラー
    func getValue() {
        //データベースの参照URL
        let ref2 = Database.database().reference()
        //Firebaseからデータを取り出す
        let myAp = UIApplication.shared.delegate as! AppDelegate
        var i = 0
        //bookIDの取得
        ref2.child("\(myAp.selectButton1)/\(myAp.selectButton2)/\(myAp.selectButton3)").observeSingleEvent(of: .value) { (snap,error) in
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
        }
    }
    
    //キーに応じた配列に代入
    func checkKey(k: String, v: AnyObject){
        if(k == "画像URL"){
            myAp.imageURL.append(v as! String)
        } else if(k == "学籍番号") {
            myAp.stuNumber.append(v as! String)
        } else if(k == "出版日") {
            myAp.publishDay.append(v as! String)
        }else if(k == "コメント"){
            myAp.comment.append(v as! String)
        }else if(k == "deleteID"){
            myAp.deleteID.append(v as! String)
        }
    }
    
    
    
    
    //次ボタン押された時に使う
    func nextValue(){
        var j = 0
        myAp.nextCount += 1
        if(myAp.stuNumber.count-4 >= (myAp.nextCount)*4){
            while(j < 4){
                showValue(i: j + myAp.nextCount*4, pictureImage: imageArray[j])
                j += 1
            }
        }else{
            while(j < myAp.stuNumber.count%4){
                showValue(i: j + (myAp.stuNumber.count/4)*4, pictureImage: imageArray[j])
                j += 1
            }
            while(j < 4){
                //空白にするためにUIImageの削除 新たに値を代入できない？
                //imageArray[j].removeFromSuperview()
                //白い画像を用いてそれっぽく
                viewImage(url: "https://firebasestorage.googleapis.com/v0/b/motokapp-b8915.appspot.com/o/images%2Fwhite.jpeg?alt=media&token=7a62b226-bde9-4355-ab24-1434d68566f5", imageView: imageArray[j])
                labelArray[j].text = ""
                j += 1
            }
            myAp.nextCount = myAp.stuNumber.count/4
        }
    }
    
    //戻るボタン時呼び出し　うまく動いて欲しい
    func beforeValue() {
        var j = 0
        myAp.nextCount -= 1
        if(myAp.nextCount < 0){
            myAp.nextCount = 0
        }
        while(j < 4){
            showValue(i: j + myAp.nextCount*4, pictureImage: imageArray[j])
            j += 1
        }
    }
    
    //並列処理が間に合わなかった時
    func nextValue2(){
        //データベースの参照URL
        let ref2 = Database.database().reference()
        //Firebaseからデータを取り出す
        let myAp = UIApplication.shared.delegate as! AppDelegate
        myAp.nextCount += 1
        var i = 0
        //bookIDの取得
        ref2.child("\(myAp.selectButton1)/\(myAp.selectButton2)/\(myAp.selectButton3)").observeSingleEvent(of: .value) { (snap,error) in
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
                        //~~~~~~~~~~~要素が足りない時のエラー処理~~~~~~~~~
                        if(myAp.nextCount*4 - 1 < i){
                            self.showValue(i: i, pictureImage: self.imageArray[i%4])
                            i += 1
                        }
                    }
                }
            }
        }
    }
    
    //エラー処理〜〜〜〜
    func beforeValue2(){
        //データベースの参照URL
        let ref2 = Database.database().reference()
        //Firebaseからデータを取り出す
        let myAp = UIApplication.shared.delegate as! AppDelegate
        if(myAp.nextCount > 0){
            myAp.nextCount -= 1
        }
        var i = 0
        //bookIDの取得
        ref2.child("\(myAp.selectButton1)/\(myAp.selectButton2)/\(myAp.selectButton3)").observeSingleEvent(of: .value) { (snap,error) in
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
                            self.showValue(i: i + myAp.nextCount*4, pictureImage: self.imageArray[i])
                            i += 1
                        }
                    }
                }
            }
        }
        
    }
    
}

