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
    var dataSource: [ChooseModel] = []

    override func loadView() {
        super.loadView()
        self.pullDownRefreshed = true
        self.loadMoreRefreshed = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.contentData = ContentData.init()
        
        self.collectionView.top = 50
        self.collectionView.height = self.collectionView.height - 50

        LoadCollectionCellClass(view: self.collectionView, className: ChooseViewCell.self, name: "ChooseViewCell")
        
        self.loadTitleData()
        
        self.collectionView.mj_header.beginRefreshing()
        
        // Do any additional setup after loading the view.
    }
    
    func loadTitleData(){
        
        self.contentData?.chooseTitleList(callBlock: { (success) in
            
        })
        
    }
    
    func addTitleView(titleArray:Array<ChooseTitleModel>){
        
        let headView = UIView.init(frame: CGRect(x: 0,y: 0,width: DEF_SCREEN_WIDTH,height: 50))
        headView.backgroundColor = UIColor.white
        self.view.addSubview(headView)
        
        for index in 0..<titleArray.count{
            let titleL = UILabel.init(frame: CGRect(x: DEF_SCREEN_WIDTH/CGFloat(titleArray.count)*CGFloat(index),y: 0,width: DEF_SCREEN_WIDTH/CGFloat(titleArray.count),height: 50))
            titleL.text = titleArray[index].name
            titleL.textAlignment = .center
            headView.addSubview(titleL)
        }
        
    }
    
    override func loadMoreData() {
        
        self.contentData?.pageNum = self.pageNo
        self.contentData?.pageSize = self.pageSize
        
        weak var weakSelf = self
        
        self.contentData?.chooseGifeList { (success) in
            if success{
                
                if weakSelf?.pageNo == 0{
                    weakSelf?.collectionView.mj_header.endRefreshing()
                    weakSelf?.dataSource.removeAll()
                }else{
                    weakSelf?.collectionView.mj_footer.endRefreshing()
                }

                weakSelf?.dataSource = (weakSelf?.dataSource)! + (weakSelf?.contentData?.chooseArray)!

                if (weakSelf?.contentData?.chooseArray.count)! < (weakSelf?.pageSize)!{
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
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ChooseViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChooseViewCell", for: indexPath) as! ChooseViewCell
        cell.initWithData((self.dataSource[indexPath.row]))
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (DEF_SCREEN_WIDTH - 30)/2, height: 185 + self.dataSource[indexPath.row].contentHeight)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
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
