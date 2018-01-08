//
//  MorePostsVC.swift
//  Simple_swift
//
//  Created by iosdev on 2018/1/4.
//  Copyright © 2018年 gezhenrong. All rights reserved.
//

import UIKit

class MorePostsVC: WYBaseTableViewVC {
    
    var contentData:ContentData?
    var limit:Int?

    override func loadView() {
        super.loadView()
        self.pullDownRefreshed = false
        self.loadMoreRefreshed = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "查看全部"
        
        self.contentData = ContentData.init()

        self.loadData()
        
        self.tableView.separatorStyle = .none
        
        LoadCellClass(view: self.tableView, className: MorePostsCell.self, name: "MorePostsCell")

        // Do any additional setup after loading the view.
    }
    
    func loadData() {

        self.contentData?.limit = 20
        self.contentData?.loadCollectionsLookAll(callBlock: { (success) in
            if success{
                self.tableView.reloadData()
            }else{
                
            }
        })
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.contentData?.partArray == nil {
            return 0
        }
        return (self.contentData?.partArray.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MorePostsCell") as! MorePostsCell
        cell.initWithModel((self.contentData?.partArray[indexPath.row])!)
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
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
