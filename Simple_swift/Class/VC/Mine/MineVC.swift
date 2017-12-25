//
//  MineVC.swift
//  Simple_swift
//
//  Created by greatRong on 2017/12/7.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit

class MineVC: BaseVC {
    //,SwipeTableViewDelegate,SwipeTableViewDataSource
//    var swipeTableView = SwipeTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = nil
        
//        self.swipeTableView = SwipeTableView.init(frame: CGRect(x: 0,y: 0,width: DEF_SCREEN_WIDTH,height: DEF_SCREEN_HEIGHT))
//        self.swipeTableView.delegate = self
//        self.swipeTableView.dataSource = self;
//        self.swipeTableView.shouldAdjustContentSize = true
//        self.swipeTableView.swipeHeaderView =
//
//        self.view.addSubview(self.swipeTableView)
        
        // Do any additional setup after loading the view.
    }
    
//    func numberOfItems(in swipeView: SwipeTableView!) -> Int {
//        return 2
//    }
//
//    func swipeTableView(_ swipeView: SwipeTableView!, viewForItemAt index: Int, reusing view: UIScrollView!) -> UIScrollView! {
//
//    }

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
