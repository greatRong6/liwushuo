//
//  HomeVC.swift
//  Simple_swift
//
//  Created by greatRong on 2017/12/7.
//  Copyright © 2017年 gezhenrong. All rights reserved.
/**
 override  重写父类的方法
 */

import UIKit

class HomeVC: WYBaseTableViewVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = nil
        
        let leftBtn = UIButton.init(type: .custom)
        leftBtn.frame = CGRect(x: 0,y: 0,width: 20,height: 20)
        leftBtn.setImage(UIImage.init(named: "ScanButton"), for: .normal)
        leftBtn.addTarget(self, action: #selector(scanClick), for: .touchUpInside)
        let leftBtnItem = UIBarButtonItem.init(customView: leftBtn)
        self.navigationItem.leftBarButtonItem = leftBtnItem
        
        let searchBtn = UIButton.init(type: .custom)
        searchBtn.frame = CGRect(x: 0,y: 0,width: 20,height: 20)
        searchBtn.setImage(UIImage.init(named: "Feed_SearchBtn"), for: .normal)
        searchBtn.addTarget(self, action: #selector(searchClick), for: .touchUpInside)
        let rightBtnItem = UIBarButtonItem.init(customView: searchBtn)
        self.navigationItem.rightBarButtonItem = rightBtnItem
        
        LoadCellClass(view: self.tableView, className: HomeCell.self, name: "HomeCell")
        
        // Do any additional setup after loading the view.
    }
    
    override func loadMoreData() {
        
    }
    
    @objc func scanClick(){
        
        let scan = ScanVC.init()
        scan.title = "扫一扫"
        scan.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(scan, animated: true)
        
    }
    
    @objc func searchClick(){
        
        let search = SearchVC.init()
        self.navigationController?.pushViewController(search, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:HomeCell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as! HomeCell
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        ProgressHUD.show("错误提示", interaction: false)
        ProgressHUD.show()
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
