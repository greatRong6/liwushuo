//
//  StrategyVC.swift
//  Simple_swift
//
//  Created by iosdev on 2019/4/24.
//  Copyright © 2019 gezhenrong. All rights reserved.
//

import UIKit

class StrategyVC: BaseVC,UITableViewDelegate,UITableViewDataSource {

    var homeData:HomeData?
    var tableView:UITableView?

//    override func loadView() {
//        super.loadView()
//        self.pullDownRefreshed = false
//        self.loadMoreRefreshed = false
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = nil
        
        self.homeData = HomeData.init()
        
        self.tableView = UITableView.init(frame: CGRect(x: 0,y: 0,width: self.view.frame.size.width,height: self.view.frame.size.height), style: .plain)
        self.tableView?.delegate = self;
        self.tableView?.dataSource = self;
        self.view.addSubview(self.tableView!)

//        self.tableView.frame.size.width = DEF_SCREEN_WIDTH/4
//        LoadCellClass(view: self.tableView, className: StrategyCell.self, name: "StrategyCell")
        
        self.tableView?.register(StrategyCell.self, forCellReuseIdentifier: "cellId")
        self.tableView?.tableFooterView = UIView.init()
        
//        self.loadData()
        
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        
        self.homeData?.loadCategoriesData(callBlock: { (success) in
            if(success){
                
            }else{
                
            }
        })
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if self.homeData?.cateModel.data.count == 0 || self.homeData?.cateModel == nil{
//            return 0
//        }
//        return (self.homeData?.cateModel.data.count)!
//        return 10
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("121232");
        let cell:StrategyCell = tableView.dequeueReusableCell(withIdentifier: "cellId") as! StrategyCell
        cell.name?.text = "121232"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    
}
