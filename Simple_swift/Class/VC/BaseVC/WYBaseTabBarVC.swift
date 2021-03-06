//
//  WYBaseTabBarVC.swift
//  Simple_swift
//
//  Created by greatRong on 2017/12/7.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit

class WYBaseTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.creatSubviews()
        
        self.selectedIndex = 0
        self.tabBar.tintColor = DefauleColor()
        // Do any additional setup after loading the view.
    }
    
    func creatSubviews(){
        
        let homeVC = HomeVC.init()
        homeVC.title = "礼物说"
        homeVC.tabBarItem = UITabBarItem.init(title: "礼物说", image: UIImage.init(named: "TabBar_home"), selectedImage: UIImage.init(named: "TabBar_home_selected"))
        
        let singleVC = SingleVC.init()
        singleVC.title = "热门"
        singleVC.tabBarItem = UITabBarItem.init(title: "热门", image: UIImage.init(named: "TabBar_gift"), selectedImage: UIImage.init(named: "TabBar_gift_selected"))
        
        let contentVC = ClassifyVC.init()
        contentVC.title = "分类"
        contentVC.tabBarItem = UITabBarItem.init(title: "分类", image: UIImage.init(named: "TabBar_category"), selectedImage: UIImage.init(named: "TabBar_category_selected"))
        
        let mineVC = PeopleVC.init()
        mineVC.title = "我的"
        mineVC.tabBarItem = UITabBarItem.init(title: "我的", image: UIImage.init(named: "TabBar_me_boy"), selectedImage: UIImage.init(named: "TabBar_me_boy_selected"))
        
        let nav1 = WYBaseNaviVC.init(rootViewController: homeVC)
        let nav2 = WYBaseNaviVC.init(rootViewController: singleVC)
        let nav3 = WYBaseNaviVC.init(rootViewController: contentVC)
        let nav4 = WYBaseNaviVC.init(rootViewController: mineVC)
        
        self.viewControllers = [nav1,nav2,nav3,nav4]
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
                
        switch item.tag {
        case 0:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "firstResh"), object: self)
            break
        default: break
            
        }
        
    }
        
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

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
