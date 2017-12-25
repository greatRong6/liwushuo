//
//  HomeChildVC.swift
//  Simple_swift
//
//  Created by iosdev on 2017/12/25.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit

class HomeChildVC: WYBaseTableViewVC {

    var typeId: String = ""
    var homeData:HomeData?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pullDownRefreshed = false
        self.loadMoreRefreshed = false

        self.homeData = HomeData.init()

        LoadCellClass(view: self.tableView, className: HomeChildCell.self, name: "HomeChildCell")
        
        // Do any additional setup after loading the view.
    }
    
    override func loadMoreData() {
        
        self.homeData?.typeId = self.typeId
        weak var weakSelf = self
        self.homeData?.loadProductData(callBlock: { (success) in
            if success{
                weakSelf?.tableView.reloadData()
            }else{
                
            }
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.homeData?.dataSource == nil{
            return 0
        }
        return (self.homeData?.dataSource.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:HomeChildCell = tableView.dequeueReusableCell(withIdentifier: "HomeChildCell") as! HomeChildCell
        cell.initWithData((self.homeData?.dataSource[indexPath.row])!)
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
