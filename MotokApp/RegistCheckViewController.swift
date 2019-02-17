//
//  RegistCheckViewController.swift
//  MotokApp
//
//  Created by 西俣雷斗 on 2019/02/15.
//  Copyright © 2019 西俣雷斗. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

class RegistCheckViewController: UIViewController {

    var ref: DatabaseReference!
    let myAp = UIApplication.shared.delegate as! AppDelegate
    var bookid = ""
    var addimageURL : String!
    var i = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
        //StudentNumVIew
    }
    @IBOutlet weak var StudentNumVIew: UILabel!
    @IBOutlet weak var BooksNameView: UILabel!
    @IBOutlet weak var cameraImage2: UIImageView!
    @IBOutlet weak var CommentView: UITextView!
    
   // self.dimiss(animated: true, completion: nil)
    
    @IBAction func YesButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "goFinalScreen", sender: nil)
        bookid = NSUUID().uuidString
        let myAp = UIApplication.shared.delegate as! AppDelegate
        myAp.adddeleteID = ["deleteid": bookid]
        print(myAp.addstuNumber)
        
        ref.child(myAp.selectButton1).child(bookid).setValue(myAp.addstuNumber)
        ref.child(myAp.selectButton1).child(bookid).updateChildValues(myAp.addcomment)
        ref.child(myAp.selectButton1).child(bookid).updateChildValues(myAp.addpublishday)
        ref.child(myAp.selectButton1).child(bookid).updateChildValues(myAp.adddeleteID)
        //let image:UIImage! = myAp.toaddpicture.image
        self.fileupload(deta: myAp.toaddpicture)
        print("aaaaaaaaa")
        print(addimageURL)
       //let data  = ["画像URL": addimageURL!]
       //ref.child("本").child("教科書/1学年/解析学").child(bookid).updateChildValues(data)
    }
    
    //UIImageViewの画像をでStorageにアップロードかつURLの取得
    func fileupload(deta: UIImage) {
        let myAp = UIApplication.shared.delegate as! AppDelegate
        //保存するURLを指定
        let storage = Storage.storage()
        let storageRef = storage.reference()
        //ディレクトリを指定
        let uuid = NSUUID().uuidString
        let imageRef = storageRef.child("images/\(uuid)")
        //保存を実行して、metadataにURLが含まれているので、あとはよしなに加工
        let imageData = deta.jpegData(compressionQuality: 0.1)!
        imageRef.putData(imageData, metadata: nil) { metadata, error in
            if (error != nil) {
                print("Uh-oh, an error occurred!")
            } else {
                imageRef.downloadURL { (url, error) in
                    guard let downloadURL = url else {
                        // Uh-oh, an error occurred!
                        return
                    }
                    print("URL")
                    //var myAp = UIApplication.shared.delegate as! AppDelegate
                    print(downloadURL)
                    self.addimageURL = downloadURL.absoluteString
                    print(1)
                    print(self.addimageURL!)
                    let data  = ["画像URL": self.addimageURL!]
                    self.ref.child(myAp.selectButton1).child(self.bookid).updateChildValues(data)
                }
            }
        }
    }
    
    @IBAction func getURL(_ sender: AnyObject) {
        let image:UIImage! = cameraImage2.image
        fileupload(deta: image)
    }
    
    @IBAction func getImage(_ sender: AnyObject) {
        let storage = Storage.storage()
        let httpsReference = storage.reference(forURL: "https://firebasestorage.googleapis.com/v0/b/test2-2e5fb.appspot.com/o/images%2F2.jpg?alt=media&token=a31e89a7-9b8d-4d57-99f6-593b5995e894")
        
        // Create a reference to the file you want to download
        let islandRef = httpsReference //.child("images/island.jpg")
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        islandRef.getData(maxSize: 30 * 1024 * 1024) { data, error in
            if error != nil {
                // Uh-oh, an error occurred!
            } else {
                // Data for "images/island.jpg" is returned
                let image = UIImage(data: data!)
                self.cameraImage2.image = image
            }
        }
    }
    
    
    @IBAction func NoButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "goBackRegistration", sender: nil)
    }
}
