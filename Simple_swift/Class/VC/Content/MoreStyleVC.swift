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
    
    override func loadView() {
        super.loadView()
        self.pullDownRefreshed = false
        self.loadMoreRefreshed = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.contentData = ContentData.init()

        LoadNibCellClass(view: self.tableView, name: "HomeChildCell")
        
        self.loadData()
        
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        
        weak var weakSelf = self
        
        self.contentData?.loadStylesOrCategory(callBlock: { (success) in
            if success{
                weakSelf?.tableView.reloadData()
            }else{
                
            }
        })
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:HomeChildCell = tableView.dequeueReusableCell(withIdentifier: "HomeChildCell") as! HomeChildCell
//        cell.initWithData((self.dataSource[indexPath.row]))
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
