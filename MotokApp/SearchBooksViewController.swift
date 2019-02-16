//
//  SearchBooksViewController.swift
//  MotokApp
//
//  Created by 伊藤恵研究室 on 2019/02/17.
//  Copyright © 2019年 西俣雷斗. All rights reserved.
//

import UIKit

class SearchBooksViewController: UIViewController {

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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
