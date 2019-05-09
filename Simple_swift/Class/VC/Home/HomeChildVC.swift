//
//  HomeChildVC.swift
//  Simple_swift
//
//  Created by iosdev on 2019/4/24.
//  Copyright © 2019 gezhenrong. All rights reserved.
//

import UIKit

class HomeChildVC: WYBaseTableViewVC {
    
    var typeId: String = ""
    var homeData:HomeData?
    var dataSource: [HomeModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.homeData = HomeData.init()
                
        LoadNibCellClass(view: self.tableView, name: "HomeChildCell")
        
        self.tableView.mj_header.beginRefreshing()
        self.tableView.separatorStyle = .none

        
        // Do any additional setup after loading the view.
    }
    
    override func loadMoreData() {
        
        self.homeData?.pageNum = self.pageNo
        self.homeData?.pageSize = self.pageSize
        self.homeData?.home_Url = HomeData_Url + "\(typeId)/items"
        
        weak var weakSelf = self
        self.homeData?.loadProductData(callBlock: { (success) in
            if success{
                
                if weakSelf?.pageNo == 0{
                    weakSelf?.tableView.mj_header.endRefreshing()
                    weakSelf?.dataSource.removeAll()
                }else{
                    weakSelf?.tableView.mj_footer.endRefreshing()
                }
                
                weakSelf?.dataSource = (weakSelf?.dataSource)! + (weakSelf?.homeData?.dataArray)!
                
                if (weakSelf?.homeData?.dataArray.count)! < (weakSelf?.pageSize)!{
                    weakSelf?.tableView.mj_footer.resetNoMoreData()
                }
                
                weakSelf?.pageNo+=1
                weakSelf?.tableView.reloadData()
                
            }else{
                weakSelf?.tableView.mj_header.endRefreshing()
                weakSelf?.tableView.mj_footer.endRefreshing()
            }
        })
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:HomeChildCell = tableView.dequeueReusableCell(withIdentifier: "HomeChildCell") as! HomeChildCell
        cell.initWithData((self.dataSource[indexPath.row]))
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let web:LoadWebVC = LoadWebVC()
        web.hidesBottomBarWhenPushed = true
        web.urlStr = dataSource[indexPath.row].content_url
        self.navigationController?.pushViewController(web, animated: true)
    }
    
    deinit {
        print("销毁")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
