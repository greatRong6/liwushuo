//
//  WYBaseTableViewVC.swift
//  Simple_swift
//
//  Created by iosdev on 2017/12/8.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit

class WYBaseTableViewVC: BaseVC,UITableViewDelegate,UITableViewDataSource {
    
    var tableViewStyle:UITableViewStyle?
    

    lazy var tableView:UITableView = {
        var tableFrame:CGRect = self.view.bounds
        tableFrame.origin.y = 0
//            CGFloat(KNavigaHeight)
        tableFrame.size.height -= (self.navigationController!.viewControllers.count > 1 ? 0 : self.tabBarController!.tabBar.bounds.height) + 0
        
        var tableView = UITableView.init(frame: tableFrame, style: .plain)
        tableView.backgroundColor = RGB(r: 230, g: 230, b: 230)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.tableView)
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style:.default, reuseIdentifier: "")
        return cell;
        
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
