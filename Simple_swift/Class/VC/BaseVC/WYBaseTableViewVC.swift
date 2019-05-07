//
//  WYBaseTableViewVC.swift
//  Simple_swift
//
//  Created by iosdev on 2017/12/8.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit

class WYBaseTableViewVC: BaseVC,UITableViewDelegate,UITableViewDataSource {
    
    var tableViewStyle:UITableView.Style?
    
    var pageNo:Int = 0
    var pageSize:Int = 10
    var pullDownRefreshed:Bool = true
    var loadMoreRefreshed:Bool = true

    lazy var tableView:UITableView = {
        var tableFrame:CGRect = self.view.bounds
//        tableFrame.size.height = tableFrame.size.height - KTabarHeight - KTabarHeight
        tableFrame.size.height -= (self.navigationController!.viewControllers.count > 1 ? 0 : KTabarHeight) + CGFloat(KNavigaHeight)
        var tableView = UITableView.init(frame: tableFrame, style: .plain)
        tableView.backgroundColor = RGB(r: 230, g: 230, b: 230)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.tableView)
        self.tableView.tableFooterView = UIView.init()
        
        weak var weakSelf = self
        if self.pullDownRefreshed {
            self.tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
                weakSelf?.reloadData()
            })
        }
        if self.loadMoreRefreshed {
            self.tableView.mj_footer = MJRefreshAutoNormalFooter.init(refreshingBlock: {
                weakSelf?.loadMoreData()
            })
        }

        // Do any additional setup after loading the view.
    }
    
    func reloadData(){
        self.pageNo = 0
        self.loadMoreData()
    }
    
    func loadMoreData(){
        
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 0
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
