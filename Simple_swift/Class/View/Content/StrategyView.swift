//
//  StrategyView.swift
//  Simple_swift
//
//  Created by iosdev on 2019/4/29.
//  Copyright © 2019 gezhenrong. All rights reserved.
//

import UIKit

class StrategyView: UIView,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var tableView:UITableView?
    var collectionView:UICollectionView?
    var isScrollDowm:Bool = true

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.tableView = UITableView.init(frame: CGRect(x: 0,y: 0,width: frame.size.width/4,height: frame.size.height), style: .plain)
        self.tableView?.backgroundColor = UIColor.init(white: 0, alpha: 0.1)
        self.tableView?.delegate = self;
        self.tableView?.dataSource = self;
        self.addSubview(self.tableView!)
        
        self.tableView?.register(StrategyCell.self, forCellReuseIdentifier: "cellId")
        self.tableView?.tableFooterView = UIView.init()
        
        let layout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView.init(frame: CGRect(x: frame.size.width/4,y: 0,width: DEF_SCREEN_WIDTH - frame.size.width/4,height: frame.size.height), collectionViewLayout: layout)
        self.collectionView?.backgroundColor = UIColor.white
        self.collectionView?.delegate = self;
        self.collectionView?.dataSource = self;
        self.addSubview(self.collectionView!)
        
        LoadCollectionCellClass(view: self.collectionView!, className: StrategyCollecCell.self, name: "StrategyCollecCell")
        self.collectionView!.register(StrategyReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "StrategyReusableView")

    }
    
    /************tableViewDelegate*******************/
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:StrategyCell = tableView.dequeueReusableCell(withIdentifier: "cellId") as! StrategyCell
        cell.name?.text = "121232"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.collectionView?.scrollToItem(at: IndexPath(row: 0, section: indexPath.row), at: .top, animated: true)
    }
    
    /************collectionViewDelegate*******************/
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StrategyCollecCell", for: indexPath) as! StrategyCollecCell
//        cell.initWithData((self.contentData?.dataArray[indexPath.section - 1].channels[indexPath.row])!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat((self.collectionView?.frame.size.width)!)/3 - 20, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
    }
    
    //分区头部、尾部将要显示出来的事件响应
//    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
//        self.tableView?.selectRow(at: IndexPath(row: indexPath.section, section: 0), animated: true, scrollPosition: .top)
//    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if self.collectionView!.isDragging{
            self.tableView?.selectRow(at: IndexPath(row: indexPath.section, section: 0), animated: true, scrollPosition: .top)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if self.collectionView!.isDragging{
            self.tableView?.selectRow(at: IndexPath(row: indexPath.section, section: 0), animated: true, scrollPosition: .top)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        var reusableview:UICollectionReusableView
        reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "StrategyReusableView", for: indexPath)
//        (reusableview as! CategoryHeadView).initWithData((self.contentData?.dataArray[indexPath.section - 1].name)!)
        return reusableview

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: (self.collectionView?.frame.size.width)!,height: 50)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        scrollView.contentOffset.y
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
