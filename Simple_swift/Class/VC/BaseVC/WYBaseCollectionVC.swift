//
//  WYBaseCollectionVC.swift
//  Simple_swift
//
//  Created by iosdev on 2017/12/8.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit

class WYBaseCollectionVC: BaseVC,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView:UICollectionView = {
       
        var tableFrame:CGRect = self.view.bounds
        tableFrame.origin.y = 0
//            CGFloat(KNavigaHeight)
        tableFrame.size.height -= (self.navigationController!.viewControllers.count > 1 ? 0 : self.tabBarController!.tabBar.bounds.height)
        let layout = UICollectionViewFlowLayout.init()
        var collecitonView = UICollectionView.init(frame: tableFrame, collectionViewLayout: layout)
        collecitonView.backgroundColor = RGB(r: 230, g: 230, b: 230)
        collecitonView.delegate = self
        collecitonView.dataSource = self
        return collecitonView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.collectionView)
        // Do any additional setup after loading the view.
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath)
        return cell
    }
    
    //最小 item 间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }
    
    //最小行间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }
    
    //item 的尺寸
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 0, height: 0);
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
