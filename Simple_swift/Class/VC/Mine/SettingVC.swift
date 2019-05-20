//
//  SettingVC.swift
//  Simple_swift
//
//  Created by iosdev on 2019/5/20.
//  Copyright © 2019 gezhenrong. All rights reserved.
//

import UIKit

class SettingVC: WYBaseTableViewVC {

    override func loadView() {
        super.loadView()
        self.pullDownRefreshed = false
        self.loadMoreRefreshed = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "设置"
        
        // Do any additional setup after loading the view.
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
