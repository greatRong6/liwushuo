//
//  HomeVC.swift
//  Simple_swift
//
//  Created by greatRong on 2017/12/7.
//  Copyright © 2017年 gezhenrong. All rights reserved.
/**
 override  重写父类的方法
 */

import UIKit

class HomeVC: GZRViewController {

    var homeData:HomeData?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = nil
        
        let leftBtn = UIButton.init(type: .custom)
        leftBtn.frame = CGRect(x: 0,y: 0,width: 20,height: 20)
        leftBtn.setImage(UIImage.init(named: "ScanButton"), for: .normal)
        leftBtn.addTarget(self, action: #selector(scanClick), for: .touchUpInside)
        let leftBtnItem = UIBarButtonItem.init(customView: leftBtn)
        self.navigationItem.leftBarButtonItem = leftBtnItem
        
        let searchBtn = UIButton.init(type: .custom)
        searchBtn.frame = CGRect(x: 0,y: 0,width: 20,height: 20)
        searchBtn.setImage(UIImage.init(named: "Feed_SearchBtn"), for: .normal)
        searchBtn.addTarget(self, action: #selector(searchClick), for: .touchUpInside)
        let rightBtnItem = UIBarButtonItem.init(customView: searchBtn)
        self.navigationItem.rightBarButtonItem = rightBtnItem
        
        let array = ["精选", "海淘", "礼物", "美食", "数码", "运动", "涨姿势"];
        self.initWithTitleButton(titleArray: array)
        
        let oneVC   = HomeOneVC.init()
        oneVC.typeId = "100"
        oneVC.view.backgroundColor = UIColor.blue
        self.addChildViewController(oneVC)
        
        let twoVC   = HomeChildVC.init()
        twoVC.typeId = "129"
        twoVC.view.backgroundColor = UIColor.yellow
        self.addChildViewController(twoVC)

        let threeVC = HomeChildVC.init()
        threeVC.typeId = "111"
        threeVC.view.backgroundColor = UIColor.green
        self.addChildViewController(threeVC)

        let fourVC  = HomeChildVC.init()
        fourVC.typeId = "118"
        fourVC.view.backgroundColor = UIColor.gray
        self.addChildViewController(fourVC)

        let fiveVC  = HomeChildVC.init()
        fiveVC.typeId = "121"
        self.addChildViewController(fiveVC)

        
        let sixVC   = HomeChildVC.init()
        sixVC.typeId = "123"
        self.addChildViewController(sixVC)

        
        let sevenVC = HomeChildVC.init()
        sevenVC.typeId = "120"
        self.addChildViewController(sevenVC)
        
        let arrayVC = [oneVC, twoVC, threeVC, fourVC, fiveVC, sixVC, sevenVC];
        self.initWithController(controllerArray: arrayVC)
        
        // Do any additional setup after loading the view.
    }

    @objc func scanClick(){
        
//        let scan = ScanVC.init()
//        scan.title = "扫一扫"
//        scan.hidesBottomBarWhenPushed = true
//        self.navigationController?.pushViewController(scan, animated: true)
        
        Utils.jm_cameraAuthStatus(success: {
            let scanVC = ScanVC.init()
            scanVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(scanVC, animated: true)
        }) {
            
        }
        
    }
    
    @objc func searchClick(){
        
        let search = SearchVC.init()
        search.hidesBottomBarWhenPushed = true
        search.title = "搜索一下"
        self.navigationController?.pushViewController(search, animated: true)
        
    }
        
    func setChildVcs() -> [UIViewController] {
        
        var vcArray = [Any]()
        
        for model in (self.homeData?.titleArray)!{
            
            let childVC = HomeOneVC()
            childVC.title = model.name
            childVC.typeId = String(model.typeId)
            vcArray.append(childVC)
        }
        
        return vcArray as! [UIViewController]
        
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
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
