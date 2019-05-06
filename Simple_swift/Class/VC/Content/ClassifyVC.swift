//
//  ClassifyVC.swift
//  Simple_swift
//
//  Created by iosdev on 2019/4/24.
//  Copyright © 2019 gezhenrong. All rights reserved.
//

import UIKit

class ClassifyVC: BaseVC,UIScrollViewDelegate {
    
    var scrollView:UIScrollView!
    var segment:UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = nil
        
        let searchBtn = UIButton.init(type: .custom)
        searchBtn.frame = CGRect(x: 0,y: 0,width: 20,height: 20)
        searchBtn.setImage(UIImage.init(named: "Feed_SearchBtn"), for: .normal)
        searchBtn.addTarget(self, action: #selector(searchClick), for: .touchUpInside)
        let rightBtnItem = UIBarButtonItem.init(customView: searchBtn)
        self.navigationItem.rightBarButtonItem = rightBtnItem
        
        self.segment = UISegmentedControl.init(items: ["攻略","礼物"])
        segment.tintColor = UIColor.white
        segment.frame = CGRect(x: 0,y: 0,width: 200,height: 30)
        segment.selectedSegmentIndex = 0;
        segment.addTarget(self, action: #selector(segmentedControlChange(segmented:)), for: .valueChanged)
        self.navigationItem.titleView = segment
        
        self.initWithController()
        
        // Do any additional setup after loading the view.
    }
    
    @objc func searchClick(){
//        let search = SearchVC.init()
//        search.hidesBottomBarWhenPushed = true
//        search.title = "搜索一下"
//        self.navigationController?.pushViewController(search, animated: true)
        
        let choose = ChooseGiftVC.init()
        choose.hidesBottomBarWhenPushed = true
        choose.title = "选礼神器"
        self.navigationController?.pushViewController(choose, animated: true)

    }
    
    func initWithController(){
        
        self.scrollView = UIScrollView.init(frame: CGRect(x: 0,y: 0,width: DEF_SCREEN_WIDTH,height: DEF_SCREEN_HEIGHT - KNavigaHeight - KTabarHeight))
        self.scrollView.delegate = self
        self.scrollView.isPagingEnabled = true
        self.scrollView.isScrollEnabled = true
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.showsHorizontalScrollIndicator = false;
        self.scrollView.backgroundColor = UIColor.clear
        self.scrollView.contentSize = CGSize(width: DEF_SCREEN_WIDTH*2, height: 0)
        self.view.addSubview(self.scrollView)
        
//        let arrayVC = [ContentView(), StrategyView()];
        let contentView = ContentView.init(frame: CGRect(x: 0,y: 0,width: DEF_SCREEN_WIDTH,height: self.scrollView.frame.self.height))
        self.scrollView .addSubview(contentView)
        
        let strategyView = StrategyView.init(frame: CGRect(x: DEF_SCREEN_WIDTH,y: 0,width: DEF_SCREEN_WIDTH,height: self.scrollView.frame.self.height))
        self.scrollView .addSubview(strategyView)

    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x / DEF_SCREEN_WIDTH
        UIView.animate(withDuration: 0.3) {
            self.segment.selectedSegmentIndex = Int(index)
        }

    }
    
    @objc func segmentedControlChange(segmented: UISegmentedControl) {
        if segmented.selectedSegmentIndex == 0 {
            UIView.animate(withDuration: 0.3) {
                self.scrollView.contentOffset = CGPoint(x: 0, y: 0)
            }
        }else if segmented.selectedSegmentIndex == 1 {
            UIView.animate(withDuration: 0.3) {
                self.scrollView.contentOffset = CGPoint(x: DEF_SCREEN_WIDTH, y: 0)
            }
        }
    }
    
    deinit {
        
    }
    
}
