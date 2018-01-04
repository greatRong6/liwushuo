//
//  ContentVC.swift
//  Simple_swift
//
//  Created by greatRong on 2017/12/7.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit

class ContentVC: WYBaseTableViewVC {

    var contentData:ContentData?

    override func loadView() {
        super.loadView()
        self.pullDownRefreshed = false
        self.loadMoreRefreshed = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = nil
        
        let searchBtn = UIButton.init(type: .custom)
        searchBtn.frame = CGRect(x: 0,y: 0,width: 20,height: 20)
        searchBtn.setImage(UIImage.init(named: "Feed_SearchBtn"), for: .normal)
        searchBtn.addTarget(self, action: #selector(searchClick), for: .touchUpInside)
        let rightBtnItem = UIBarButtonItem.init(customView: searchBtn)
        self.navigationItem.rightBarButtonItem = rightBtnItem

        self.contentData = ContentData.init()
        
        LoadCellClass(view: self.tableView, className: CategoryCell.self, name: "CategoryCell")

        let headView = ProjectView.init(frame: CGRect(x: 0,y: 0,width: DEF_SCREEN_WIDTH,height: 120))
        headView.moreButtonBlock = {
            let morePort = MorePostsVC()
            morePort.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(morePort, animated: true)
        }
        self.tableView.tableHeaderView = headView
        
        self.loadData()
        
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        
        weak var weakSelf = self
        
        self.contentData?.loadCategoryGroup(callBlock: { (success) in
            if success{
                weakSelf?.tableView.reloadData()
            }else{
                
            }
        })
    }
    
    @objc func searchClick(){
        let search = SearchVC.init()
        search.hidesBottomBarWhenPushed = true
        search.title = "搜索一下"
        self.navigationController?.pushViewController(search, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.contentData?.dataArray == nil {
            return 0
        }
        return (self.contentData?.dataArray.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CategoryCell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as! CategoryCell
        cell.initWithData((self.contentData?.dataArray[indexPath.row])!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let count = ceilf(Float(CGFloat((self.contentData?.dataArray[indexPath.row].channels.count)!) / 4.0))
        
        let height = CGFloat(count) * 90 + CGFloat(40)
        return height
        
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
