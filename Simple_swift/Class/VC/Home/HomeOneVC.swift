//
//  HomeOneVC.swift
//  Simple_swift
//
//  Created by iosdev on 2017/12/25.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit

class HomeOneVC: WYBaseTableViewVC {

    var typeId: String = ""
    var homeData:HomeData?
    var dataSource: [HomeModel] = []
    
    override func loadView() {
        super.loadView()
        self.pullDownRefreshed = true
        self.loadMoreRefreshed = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.homeData = HomeData.init()

        LoadNibCellClass(view: self.tableView, name: "HomeChildCell")
                
        self.tableView.frame = CGRect(x: 0,y: 0,width: DEF_SCREEN_WIDTH,height: DEF_SCREEN_HEIGHT - 44 - CGFloat(KTabarHeight) - CGFloat(KNavigaHeight))

        self.tableView.mj_header.beginRefreshing()
        self.tableView.separatorStyle = .none
        
        // Do any additional setup after loading the view.
    }
    
    override func loadMoreData() {
        
        self.homeData?.pageNum = self.pageNo
        self.homeData?.pageSize = self.pageSize
        self.homeData?.home_Url = Home_Url + "\(typeId)/items"

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
        self.navigationController?.pushViewController(web, animated: true)
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
