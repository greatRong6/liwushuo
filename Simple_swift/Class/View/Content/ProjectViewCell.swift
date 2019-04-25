//
//  ProjectViewCell.swift
//  Simple_swift
//
//  Created by iosdev on 2018/1/3.
//  Copyright © 2018年 gezhenrong. All rights reserved.
//

import UIKit

class ProjectViewCell: UICollectionViewCell , UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    var contentData:ContentData?
    
    typealias moreBlock = (Int) ->Void
    var moreButtonBlock:moreBlock?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        let titleLabel:UILabel = UILabel.init(frame: CGRect(x: 10,y: 10,width: 100,height: 20))
        titleLabel.text = "专题"
        titleLabel.font = UIFont.systemFont(ofSize: 15.0)
        self.addSubview(titleLabel)
        
        let moreBtn = UIButton.init(type: .custom)
        moreBtn.frame = CGRect(x: DEF_SCREEN_WIDTH - 80,y: 0,width: 70,height: 40)
        moreBtn.setTitle("查看全部 >", for: .normal)
        moreBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        moreBtn.setTitleColor(UIColor.black, for: .normal)
        moreBtn.addTarget(self, action: #selector(moreClick), for: .touchUpInside)
        self.addSubview(moreBtn)
        
        self.contentData = ContentData.init()
        
        self.addSubview(self.collectionView)
        
        LoadCollectionCellClass(view: self.collectionView, className: ProjectCell.self, name: "ProjectCell")
        
        self.loadData()
    }
    
    @objc func moreClick(){
        if moreButtonBlock != nil{
            moreButtonBlock!(6)
        }
    }
    
    func loadData(){
        
        weak var weakSelf = self
        
        self.contentData?.requestUrl = Collections_Url + "\(4)/posts"
        self.contentData?.loadCollectionsPosts(callBlock: { (success) in
            if success{
                weakSelf?.collectionView.reloadData()
            }else{
                
            }
        })

    }
    
    lazy var collectionView:UICollectionView = {
        
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        var collectionView = UICollectionView.init(frame: CGRect(x: 0,y: 40,width: DEF_SCREEN_WIDTH,height: 80), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false

        return collectionView
        
    }()
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.contentData?.partArray.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectCell", for: indexPath) as! ProjectCell
        cell.initWithData((self.contentData?.partArray[indexPath.row])!)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let model:PostsModel = (self.contentData?.partArray[indexPath.row])!
        
        if moreButtonBlock != nil{
            moreButtonBlock!(model.group_id)
        }
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
