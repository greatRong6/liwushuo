//
//  MineVC.swift
//  Simple_swift
//
//  Created by greatRong on 2017/12/7.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit

class MineVC: BaseVC,UITableViewDelegate,UITableViewDataSource {
    
    var tableView:UITableView?
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = nil
        
        self.tableView = UITableView.init(frame: CGRect(x: 0,y: 0,width: self.view.frame.size.width,height: self.view.frame.size.height), style: .plain)
        self.tableView?.delegate = self;
        self.tableView?.dataSource = self;
        self.view.addSubview(self.tableView!)

        self.tableView?.register(StrategyCell.self, forCellReuseIdentifier: "cellId")
        self.tableView?.tableFooterView = UIView.init()

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:StrategyCell = tableView.dequeueReusableCell(withIdentifier: "cellId") as! StrategyCell
        cell.name?.text = "121232"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
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
