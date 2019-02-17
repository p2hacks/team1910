//
//  SearchBooksViewController.swift
//  MotokApp
//
//  Created by 伊藤恵研究室 on 2019/02/17.
//  Copyright © 2019年 西俣雷斗. All rights reserved.
//

import UIKit

class SearchBooksViewController: UIViewController {
var myAp = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    
    
    
    @IBAction func selectButton(_ sender: Any) {
        performSegue(withIdentifier: "goRegistViewController", sender: nil)
    }
    
    
    @IBAction func searchText(_ sender: Any) {
    }
    
    @IBAction func searchButton(_ sender: Any) {
    }
    
    @IBAction func bibunn(_ sender: Any) {
        myAp.selectButton1 = "本/教科書/1学年/解析学1"
    }
    @IBAction func sekibunn(_ sender: Any) {
        myAp.selectButton1 = "本/教科書/1学年/解析学2"
    }
    @IBAction func sennkei1(_ sender: Any) {
         myAp.selectButton1 = "本/教科書/2学年/線形代数学"
    }
    @IBAction func sennk(_ sender: Any) {
        myAp.selectButton1 = "本/教科書/1学年/線形代数学"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
