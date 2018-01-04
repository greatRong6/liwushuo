//
//  CategoryVC.swift
//  Simple_swift
//
//  Created by greatRong on 2018/1/4.
//  Copyright © 2018年 gezhenrong. All rights reserved.
//

import UIKit

class CategoryVC: WYBaseTableViewVC {
    
    var contentData:ContentData?
    var styleId:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        self.contentData = ContentData.init()
        
        self.loadData()

        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        
        self.contentData?.requestUrl = StyleCategory_Url + "\(styleId)/items"
        self.contentData?.loadStylesOrCategory(callBlock: { (success) in
            if success{
                self.tableView.reloadData()
            }else{
                
            }
        })
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
