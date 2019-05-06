//
//  ChooseGiftVC.swift
//  Simple_swift
//
//  Created by iosdev on 2019/5/6.
//  Copyright © 2019 gezhenrong. All rights reserved.
//

import UIKit

class ChooseGiftVC: WYBaseCollectionVC {

    var contentData:ContentData?
    
    override func loadView() {
        super.loadView()
        self.pullDownRefreshed = true
        self.loadMoreRefreshed = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.contentData = ContentData.init()


        // Do any additional setup after loading the view.
    }
    
    override func loadMoreData() {
        
        self.contentData?.pageNum = self.pageNo
        self.contentData?.pageSize = self.pageSize
        
        weak var weakSelf = self
        
        self.contentData?.chooseGifeList { (success) in
            if success{
                
//                if weakSelf?.pageNo == 0{
//                    weakSelf?.collectionView.mj_header.endRefreshing()
//                    weakSelf?.dataSource.removeAll()
//                }else{
//                    weakSelf?.collectionView.mj_footer.endRefreshing()
//                }
//
//                weakSelf?.dataSource = (weakSelf?.dataSource)! + (weakSelf?.simpleData?.dataArray)!
//
//                if (weakSelf?.simpleData?.dataArray.count)! < (weakSelf?.pageSize)!{
//                    weakSelf?.collectionView.mj_footer.resetNoMoreData()
//                }
//
//                weakSelf?.pageNo+=1
//                weakSelf?.collectionView.reloadData()
//
//            }else{
//                weakSelf?.collectionView.mj_header.endRefreshing()
//                weakSelf?.collectionView.mj_footer.endRefreshing()
//            }
            }
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
