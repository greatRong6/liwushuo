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
    var dataSource: [SimpleModel] = []

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
        
        self.collectionView.mj_header.beginRefreshing()        

        // Do any additional setup after loading the view.
    }
    
    override func loadMoreData() {
        
        self.simpleData?.pageNum = self.pageNo
        self.simpleData?.pageSize = self.pageSize
        
        weak var weakSelf = self
        
        self.simpleData?.loadProductData { (success) in
            if success{
                
                if weakSelf?.pageNo == 0{
                    weakSelf?.collectionView.mj_header.endRefreshing()
                    weakSelf?.dataSource.removeAll()
                }else{
                    weakSelf?.collectionView.mj_footer.endRefreshing()
                }
                
                weakSelf?.dataSource = (weakSelf?.dataSource)! + (weakSelf?.simpleData?.dataArray)!
                
                if (weakSelf?.simpleData?.dataArray.count)! < (weakSelf?.pageSize)!{
                    weakSelf?.collectionView.mj_footer.resetNoMoreData()
                }
                
                weakSelf?.pageNo+=1
                weakSelf?.collectionView.reloadData()
                
            }else{
                weakSelf?.collectionView.mj_header.endRefreshing()
                weakSelf?.collectionView.mj_footer.endRefreshing()
            }
        }
    }
    
    @objc func searchClick(){
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:SingleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SingleCell", for: indexPath) as! SingleCell
        cell.initWithData(self.dataSource[indexPath.row])
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
        return CGSize(width: (DEF_SCREEN_WIDTH-10)/2, height: 235);
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
