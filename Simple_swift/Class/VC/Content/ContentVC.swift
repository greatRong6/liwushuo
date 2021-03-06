//
//  ContentVC.swift
//  Simple_swift
//
//  Created by iosdev on 2019/5/9.
//  Copyright © 2019 gezhenrong. All rights reserved.
//

import UIKit

class ContentVC: BaseVC,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var collectionView:UICollectionView?
    var contentData:ContentData?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.contentData = ContentData.init()
        
        let layout = UICollectionViewFlowLayout.init()
        self.collectionView = UICollectionView.init(frame: CGRect(x: 0,y: 0,width: DEF_SCREEN_WIDTH,height: self.view.height - KTabarHeight - KNavigaHeight), collectionViewLayout: layout)
        self.collectionView!.delegate = self
        self.collectionView!.dataSource = self
        self.view.addSubview(self.collectionView!)
        
        self.collectionView!.backgroundColor = UIColor.white
        
        LoadCollectionCellClass(view: self.collectionView!, className: ProjectViewCell.self, name: "ProjectViewCell")
        LoadCollectionCellClass(view: self.collectionView!, className: CategoryCell.self, name: "CategoryCell")
        self.collectionView!.register(CategoryHeadView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "CategoryHeadView")
        
        self.loadData()

        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        
        self.contentData?.loadCategoryGroup(callBlock: { (success) in
            if success{
                self.collectionView?.reloadData()
            }else{
                
            }
        })
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if self.contentData?.dataArray == nil {
            return 1
        }
        return (self.contentData?.dataArray.count)! + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.contentData?.dataArray == nil {
            return 0
        }
        if section == 0 {
            return 1
        }
        return (self.contentData?.dataArray[section-1].channels.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectViewCell", for: indexPath) as! ProjectViewCell
            cell.moreButtonBlock = {(index) in
                let morePort = MorePostsVC()
                morePort.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(morePort, animated: true)
            }
            return cell
            
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.initWithData((self.contentData?.dataArray[indexPath.section - 1].channels[indexPath.row])!)
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0{
            return CGSize(width: DEF_SCREEN_WIDTH,height: 130)
        }
        return CGSize(width: DEF_SCREEN_WIDTH / 4, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusableview:UICollectionReusableView
        reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CategoryHeadView", for: indexPath)
        (reusableview as! CategoryHeadView).initWithData((self.contentData?.dataArray[indexPath.section - 1].name)!)
        return reusableview
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section != 0 {
            return CGSize(width: DEF_SCREEN_WIDTH,height: 50)
        }
        return CGSize(width: 0,height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let styleVC = MoreStyleVC.init()
        styleVC.title = self.contentData?.dataArray[indexPath.section-1].channels[indexPath.row].name
        styleVC.styleId = (self.contentData?.dataArray[indexPath.section-1].channels[indexPath.row].group_id)!
        styleVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(styleVC, animated: true)
        
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
