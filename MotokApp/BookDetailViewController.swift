//
//  BookDetailViewController.swift
//  MotokApp
//
//  Created by 西俣雷斗 on 2019/02/15.
//  Copyright © 2019 西俣雷斗. All rights reserved.
//

import UIKit
//検索して、見つけた教科書の詳細を示す画面
class BookDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //画面の指示
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
        performSegue(withIdentifier: "goApplyFinishView", sender: nil)
        
    }
    
}
