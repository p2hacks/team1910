//
//  RegistrationViewController.swift
//  MotokApp
//
//  Created by 西俣雷斗 on 2019/02/14.
//  Copyright © 2019 西俣雷斗. All rights reserved.
//

import UIKit
import FirebaseStorage

class RegistrationViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputComment.text = "投稿するものの状態やコメントを書いてください"
        //delegateの伝達先をRegistrationViewControllerに設定
        inputStudentNum.delegate = self
        inputBookName.delegate = self
        inputComment.delegate = self
        
        //改行ボタンを完了ボタンに変更
        inputStudentNum.returnKeyType = .done
        inputBookName.returnKeyType = .done
        inputComment.returnKeyType = .done
        //文字が何も入力されていない時に表示される文字(薄っすら見える文字)
        inputStudentNum.placeholder = "学籍番号"
        
    }
    
    @IBOutlet weak var inputStudentNum: UITextField!
    //選択した写真を表示
    @IBOutlet weak var cameraImage: UIImageView!
    //カメラボタンのアクション
    @IBAction func cameraButtonAction(_ sender: Any) {
        //カメラが利用可能かどうか
        let alertController = UIAlertController(title: "確認", message: "選択してください", preferredStyle: .actionSheet)
        //利用可能なら
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            //カメラの選択肢を定義
            let cameraAction = UIAlertAction(title: "カメラ", style: .default, handler: { (action:UIAlertAction) in
                //カメラを起動する
                let imagePickerController : UIImagePickerController = UIImagePickerController()
                imagePickerController.delegate = self
                self.present(imagePickerController, animated: true, completion: nil)
            })
            alertController.addAction(cameraAction)
        }
        //フォトライブラリが利用可能か
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            //フォトライブラリの選択肢を定義
            let photoLibraryAction = UIAlertAction(title: "フォトライブラリー",style: .default, handler: { (action:UIAlertAction) in
                //フォトライブラリを起動
                let imagePickerController : UIImagePickerController = UIImagePickerController()
                imagePickerController.sourceType = .photoLibrary
                imagePickerController.delegate = self
                self.present(imagePickerController, animated: true, completion: nil)
            })
            alertController.addAction(photoLibraryAction)
            
        }
        
                /*let sourceType:UIImagePickerController.SourceType =
                    UIImagePickerController.SourceType.photoLibrary
                
                if UIImagePickerController.isSourceTypeAvailable(
                    UIImagePickerController.SourceType.photoLibrary){
                    // インスタンスの作成
                    let cameraPicker = UIImagePickerController()
                    cameraPicker.sourceType = sourceType
                    cameraPicker.delegate = self
                    self.present(cameraPicker, animated: true, completion: nil)
                    print("a")
                }
                else{
                    print("b")
                }*/
        /*
        //選択
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                setImageToScene(image: image)
            }
        }
        */
        //キャンセルの選択肢を定義
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        // ipadでの対策
        alertController.popoverPresentationController?.sourceView = view
        
        //選択肢を画面に表示
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    
    //コメント欄
    @IBOutlet weak var inputComment: UITextView!
    
    //入力後キーボードを閉じる。
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        //入力されたテキストをinputKeyに保存し、その値をコンソールに表示する
        if let inputKey = textField.text {
            print(inputKey)
        }
        return true
    }
    
    //撮影が終わった際に呼ばれるdelegateメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        /*//imageViewにカメラで撮った写真を保存する
        cameraImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImageView
        //cameraImage = info[UIImagePickerController.]*/
        //カメラを閉じる
        dismiss(animated: true, completion: nil)
        if let pickedImage = info[.originalImage]
            as? UIImage {
            cameraImage.contentMode = .scaleAspectFit
            cameraImage.image = pickedImage
        }
    }
    //教科書のタイトル
    @IBOutlet weak var inputBookName: UITextField!
    //完了ボタン
    @IBAction func doneButton(_ sender: Any) {
        performSegue(withIdentifier: "checkScreenViewController", sender: nil)
        
        let myAp = UIApplication.shared.delegate as! AppDelegate
        myAp.addstuNumber = ["学籍番号": inputStudentNum.text!]
        myAp.addpublishday = ["出版日": inputBookName.text!]
        myAp.addcomment = ["コメント": inputComment.text!]
        let image:UIImage! = cameraImage.image
        myAp.toaddpicture = image
        print(myAp.addstuNumber)
        print(myAp.addpublishday)
        print(myAp.addcomment)
    
    }
    
   
        
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n"){
            inputComment.resignFirstResponder()
            return false
        }
        return true
    }
}

