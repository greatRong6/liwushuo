//
//  MoreStyleVC.swift
//  Simple_swift
//
//  Created by iosdev on 2018/1/8.
//  Copyright © 2018年 gezhenrong. All rights reserved.
//

import UIKit

class MoreStyleVC: WYBaseTableViewVC {
    
    var contentData:ContentData?
    var styleId:Int = 0
    var dataSource: [PostsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.contentData = ContentData.init()
        
        LoadNibCellClass(view: self.tableView, name: "HomeChildCell")
        
        self.tableView.mj_header.state = .refreshing
        self.tableView.separatorStyle = .none
        
        // Do any additional setup after loading the view.
    }
    
    override func loadMoreData(){
        
        weak var weakSelf = self
        
        self.contentData?.pageNum = self.pageNo
        self.contentData?.pageSize = self.pageSize
        self.contentData?.requestUrl = BASE_URL + "v1/channels/\(styleId)/items"
        
        self.contentData?.loadStylesOrCategory(callBlock: { (success) in
            if success{
                if weakSelf?.pageNo == 0{
                    weakSelf?.tableView.mj_header.endRefreshing()
                    weakSelf?.dataSource.removeAll()
                }else{
                    weakSelf?.tableView.mj_footer.endRefreshing()
                }
                
                weakSelf?.dataSource = (weakSelf?.dataSource)! + (weakSelf?.contentData?.partArray)!
                
                if (weakSelf?.contentData?.partArray.count)! < (weakSelf?.pageSize)!{
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
        if self.contentData == nil {
            return 0
        }
        return (self.dataSource.count)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:HomeChildCell = tableView.dequeueReusableCell(withIdentifier: "HomeChildCell") as! HomeChildCell
        cell.initWithModel((self.dataSource[indexPath.row]))
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
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
