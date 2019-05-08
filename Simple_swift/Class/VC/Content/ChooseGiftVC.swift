//
//  ChooseGiftVC.swift
//  Simple_swift
//
//  Created by iosdev on 2019/5/6.
//  Copyright © 2019 gezhenrong. All rights reserved.
//

import UIKit

class ChooseGiftVC: WYBaseCollectionVC,GZRCollectionViewLayoutDelegate {

    var contentData:ContentData?
    var dataSource: [ChooseModel] = []
    var listView:SelectListView?

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

        let layout : CollectionViewLayout = CollectionViewLayout()
        layout.delegate = self
        self.collectionView.collectionViewLayout = layout

        LoadCollectionCellClass(view: self.collectionView, className: ChooseViewCell.self, name: "ChooseViewCell")
        
        self.loadTitleData()
        
        self.collectionView.mj_header.beginRefreshing()
        
        // Do any additional setup after loading the view.
    }
    
    func loadTitleData(){
        
        self.contentData?.chooseTitleList(callBlock: { (success) in
            self.addTitleView(titleArray: self.contentData!.titleArray)
        })
        
    }
    
    func addTitleView(titleArray:Array<ChooseTitleModel>){
        
        let headView = UIView.init(frame: CGRect(x: 0,y: 0,width: DEF_SCREEN_WIDTH,height: 50))
        headView.backgroundColor = UIColor.white
        self.view.addSubview(headView)
        
        for index in 0..<titleArray.count{
            let titleBtn = UIButton.init(type: .custom)
            titleBtn.frame = CGRect(x: DEF_SCREEN_WIDTH/CGFloat(titleArray.count)*CGFloat(index),y: 0,width: DEF_SCREEN_WIDTH/CGFloat(titleArray.count),height: 50)
            titleBtn.tag = 1000 + index
            titleBtn.setTitle(titleArray[index].name, for: .normal)
            titleBtn.setTitleColor(UIColor.black, for: .normal)
            titleBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            titleBtn.addTarget(self, action: #selector(titleButtonClick(button:)), for: .touchUpInside)
            headView.addSubview(titleBtn)
        }

    }
    
    @objc func titleButtonClick(button:UIButton){
        
        for view in self.view.subviews{
            if view.isKind(of: SelectListView.classForCoder()){
                view.removeFromSuperview()
            }
        }
        
        let index = button.tag - 1000
        self.listView = SelectListView.init(frame: CGRect(x: 0,y: 50,width: DEF_SCREEN_WIDTH,height: DEF_SCREEN_HEIGHT - 50))
        self.listView!.initWithData(titleArray: (self.contentData?.titleArray[index].channels)!)
        self.view.addSubview(self.listView!)
        self.view.bringSubview(toFront: self.listView!)
//        self.listView!.showView()
        
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
    
//    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: (DEF_SCREEN_WIDTH - 30)/2, height: 185 + self.dataSource[indexPath.row].contentHeight)
//    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func waterFlowLayout(layout: CollectionViewLayout, indexPath: NSIndexPath, itemWidth: CGFloat) -> CGFloat {
        return 185 + self.dataSource[indexPath.row].contentHeight
    }

//    deinit {
//        self.listView?.cancleView()
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
