//
//  StrategyVC.swift
//  Simple_swift
//
//  Created by iosdev on 2019/4/24.
//  Copyright © 2019 gezhenrong. All rights reserved.
//

import UIKit

class StrategyVC: WYBaseTableViewVC {

    var homeData:HomeData?

    override func loadView() {
        super.loadView()
        self.pullDownRefreshed = false
        self.loadMoreRefreshed = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = nil
        
        self.homeData = HomeData.init()

//        self.tableView.frame.size.width = DEF_SCREEN_WIDTH/4
        
        self.loadData()
        
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        
        self.homeData?.loadCategoriesData(callBlock: { (success) in
            if(success){
                
            }else{
                
            }
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if self.homeData?.cateModel.data.count == 0 || self.homeData?.cateModel == nil{
//            return 0
//        }
//        return (self.homeData?.cateModel.data.count)!
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellid = "testCellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        if cell == nil {
            cell = UITableViewCell.init(style: .value1, reuseIdentifier: cellid)
        }
//        let cateModel = self.homeData?.cateModel.data[indexPath.row]
        cell?.textLabel?.text = "121232"
        cell?.textLabel?.textColor = UIColor.red
        return cell!
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
