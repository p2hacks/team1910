//
//  BookDetailViewController.swift
//  MotokApp
//
//  Created by 西俣雷斗 on 2019/02/15.
//  Copyright © 2019 西俣雷斗. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
//検索して、見つけた教科書の詳細を示す画面
class BookDetailViewController: UIViewController {
    let myAp = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        viewImage(url: myAp.imageURL[myAp.i + myAp.nextCount*4], imageView: BookImage)
        BookName.text = "講義選択時に教科書名を代入する"
        StudentNum.text = myAp.stuNumber[myAp.i + myAp.nextCount*4]
        super.viewDidLoad()
    }
    //画面の指示 更新の必要なし
    @IBOutlet weak var directionLabel: UILabel!
    //写真表示
    @IBOutlet weak var BookImage: UIImageView!
    //教科書の名前
    @IBOutlet weak var BookName: UILabel!
    //学籍番号
    @IBOutlet weak var StudentNum: UILabel!
    //コメント
    @IBOutlet weak var CommentView: UITextView!
    //完了ボタン
    @IBAction func DecisionButtonAction(_ sender: Any) {
        deleteData()
        performSegue(withIdentifier: "goApplyFinishView", sender: nil)
    }
    
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
    
    //削除ボタン
    func deleteData(){
        let ref = Database.database().reference()
        ref.child("\(myAp.selectButton1)/\(myAp.selectButton2)/\(myAp.selectButton3)/\(myAp.deleteID[myAp.i + myAp.nextCount*4])").removeValue()
        
        let storage = Storage.storage()
        let storageRef = storage.reference(forURL: myAp.deleteID[myAp.i + myAp.nextCount*4])
        
        storageRef.delete{error in
        if let error = error {
            // Uh-oh, an error occurred!
        } else {
            // File deleted successfully
            }
        }

    }
}
