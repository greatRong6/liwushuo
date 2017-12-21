//
//  SingleVC.swift
//  Simple_swift
//
//  Created by greatRong on 2017/12/7.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit

class SingleVC: WYBaseCollectionVC {

    var simpleData:SimpleData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = nil
        
        self.loadMoreRefreshed = true
        self.pullDownRefreshed = true
        
        let searchBtn = UIButton.init(type: .custom)
        searchBtn.frame = CGRect(x: 0,y: 0,width: 20,height: 20)
        searchBtn.setImage(UIImage.init(named: "Feed_SearchBtn"), for: .normal)
        searchBtn.addTarget(self, action: #selector(searchClick), for: .touchUpInside)
        let rightBtnItem = UIBarButtonItem.init(customView: searchBtn)
        self.navigationItem.rightBarButtonItem = rightBtnItem

        LoadCollectNibCellClass(view: self.collectionView, name: "SingleCell")
        
        self.simpleData = SimpleData.init()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func loadMoreData() {
        
        self.simpleData?.pageNum = self.pageNo
        self.simpleData?.pageSize = self.pageSize
        
        self.simpleData?.loadProductData { (success) in
            if success{
                
                if self.simpleData?.dataSource.count == 0{
                    self.collectionView.mj_footer.isHidden = true
                }else{
                    
                    if ((self.simpleData?.dataSource.count)! < self.pageSize) {
                        self.collectionView.mj_footer.isHidden = true
                    }else{
                        self.collectionView.mj_footer.isHidden = false
                    }

                }
                self.collectionView.mj_header.endRefreshing()
                self.collectionView.mj_footer.endRefreshing()
                
                self.pageNo = self.pageNo + 1
                self.collectionView.reloadData()
                
            }else{
                self.collectionView.mj_header.endRefreshing()
                self.collectionView.mj_footer.endRefreshing()
            }
        }
    }
    
    @objc func searchClick(){
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.simpleData?.dataSource.count)!
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:SingleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SingleCell", for: indexPath) as! SingleCell
        cell.initWithData((self.simpleData?.dataSource[indexPath.row])!)
        return cell
    }
    
    //最小 item 间距
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10;
    }
    
    //最小行间距
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10;
    }
    
    //item 的尺寸
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (DEF_SCREEN_WIDTH-10)/2, height: 210);
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
