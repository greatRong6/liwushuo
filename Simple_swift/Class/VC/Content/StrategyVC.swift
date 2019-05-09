//
//  StrategyVC.swift
//  Simple_swift
//
//  Created by iosdev on 2019/5/9.
//  Copyright © 2019 gezhenrong. All rights reserved.
//

import UIKit

class StrategyVC: BaseVC,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var tableView:UITableView?
    var collectionView:UICollectionView?
    var isScrollDowm:Bool = true
    var lastOffsetY:CGFloat = 0
    var contentData:ContentData?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView = UITableView.init(frame: CGRect(x: 0,y: 0,width: DEF_SCREEN_WIDTH/4,height: self.view.height - KTabarHeight - KNavigaHeight), style: .plain)
        self.tableView?.backgroundColor = RGB(r: 230, g: 230, b: 230)
        self.tableView?.delegate = self;
        self.tableView?.dataSource = self;
        self.tableView?.showsVerticalScrollIndicator = false
        self.tableView?.showsHorizontalScrollIndicator = false
        self.view.addSubview(self.tableView!)
        
        self.tableView?.register(StrategyCell.self, forCellReuseIdentifier: "cellId")
        self.tableView?.tableFooterView = UIView.init()
        
        let layout = CollectionViewFlowLayout()
        self.collectionView = UICollectionView.init(frame: CGRect(x: DEF_SCREEN_WIDTH/4,y: 0,width: DEF_SCREEN_WIDTH - DEF_SCREEN_WIDTH/4,height: self.view.height), collectionViewLayout: layout)
        self.collectionView?.backgroundColor = UIColor.white
        self.collectionView?.delegate = self;
        self.collectionView?.dataSource = self;
        self.collectionView?.autoresizingMask = .flexibleHeight
        self.collectionView?.showsVerticalScrollIndicator = false
        self.collectionView?.showsHorizontalScrollIndicator = false
        self.view.addSubview(self.collectionView!)
        
        LoadCollectionCellClass(view: self.collectionView!, className: StrategyCollecCell.self, name: "StrategyCollecCell")
        self.collectionView!.register(StrategyReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "StrategyReusableView")
        
        self.contentData = ContentData.init()
        
        self.loadData()

        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        self.contentData?.loadGifeList(callBlock: { (success) in
            self.tableView?.reloadData()
            self.collectionView?.reloadData()
            self.tableView?.selectRow(at: NSIndexPath(row: 0, section: 0) as IndexPath, animated: true, scrollPosition: .top)
        })
    }
    
    /************tableViewDelegate*******************/
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.contentData?.straArray == nil {
            return 0
        }
        return (self.contentData?.straArray.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:StrategyCell = tableView.dequeueReusableCell(withIdentifier: "cellId") as! StrategyCell
        cell.name?.text = self.contentData?.straArray[indexPath.row].name
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.scrollToTopOfSection(section: indexPath.row, animated: true)
        self.tableView?.scrollToRow(at: IndexPath(row: indexPath.row, section: 0), at: .middle, animated: true)
        
    }
    
    func scrollToTopOfSection(section:NSInteger, animated:Bool){
        
        let indexPath = NSIndexPath.init(row: 0, section: section)
        let attribute = self.collectionView?.collectionViewLayout.layoutAttributesForSupplementaryView(ofKind: UICollectionElementKindSectionHeader, at: indexPath as IndexPath)
        let headerRact = attribute?.frame
        let topOfHeader = CGPoint(x: 0, y: (headerRact?.origin.y)! - (self.collectionView?.contentInset.top)!)
        self.collectionView?.setContentOffset(topOfHeader, animated: animated)
        
    }
    
    /************collectionViewDelegate*******************/
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if self.contentData?.straArray == nil {
            return 0
        }
        return (self.contentData?.straArray.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.contentData?.straArray[section].subcategories.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StrategyCollecCell", for: indexPath) as! StrategyCollecCell
        cell.initWithData((self.contentData?.straArray[indexPath.section].subcategories[indexPath.row])!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 105)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
    }
    
    //分区头部、尾部将要显示出来的事件响应
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        if !isScrollDowm && (collectionView.isDragging || collectionView.isDecelerating){
            self.selectRowAt(index: indexPath.section)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
        if isScrollDowm && (collectionView.isDragging || collectionView.isDecelerating){
            self.selectRowAt(index: indexPath.section + 1)
        }
    }
    
    func selectRowAt(index:NSInteger){
        self.tableView?.selectRow(at: IndexPath(row: index, section: 0), animated: true, scrollPosition: .middle)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //        if kind == UICollectionElementKindSectionHeader {
        //
        //        }
        var reusableview:UICollectionReusableView
        reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "StrategyReusableView", for: indexPath)
        (reusableview as! StrategyReusableView).initWithData((self.contentData?.straArray[indexPath.section].name)!)
        return reusableview
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: (self.collectionView?.frame.size.width)!,height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        let styleVC = MoreStyleVC.init()
//        styleVC.title = self.contentData?.straArray[indexPath.section].subcategories[indexPath.row].name
//        styleVC.styleId = Int((self.contentData?.straArray[indexPath.section].subcategories[indexPath.row].subCateId)!)!
//        styleVC.hidesBottomBarWhenPushed = true
//        self.navigationController?.pushViewController(styleVC, animated: true)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.collectionView == scrollView {
            isScrollDowm = lastOffsetY < scrollView.contentOffset.y
            lastOffsetY = scrollView.contentOffset.y
        }
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
