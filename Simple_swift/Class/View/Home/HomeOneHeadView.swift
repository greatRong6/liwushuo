//
//  HomeOneHeadView.swift
//  Simple_swift
//
//  Created by iosdev on 2019/5/9.
//  Copyright © 2019 gezhenrong. All rights reserved.
//

import UIKit
import SDCycleScrollView

typealias SelctPicItems = (_ index: Int) -> Void

class HomeOneHeadView: UIView,SDCycleScrollViewDelegate {
    
    var cycleScrollView:SDCycleScrollView?
    var selectItems: SelctPicItems?
    var homeData:HomeData?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.homeData = HomeData.init()
        
        cycleScrollView = SDCycleScrollView.init(frame: CGRect(x: 0,y: 0,width: DEF_SCREEN_WIDTH, height: (DEF_SCREEN_WIDTH*9)/16), delegate: self, placeholderImage: UIImage.init(named: ""))
        cycleScrollView!.autoScrollTimeInterval = 6;
        cycleScrollView!.pageControlDotSize = CGSize(width: 4,height: 4);
        cycleScrollView!.currentPageDotColor = DefauleColor();
        cycleScrollView!.pageDotColor = RGB(r: 220, g: 220, b: 220)
        cycleScrollView!.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        self.addSubview(cycleScrollView!)
        
        self.loadData()
        
        self.loadBtnData()
        
    }
    
    func loadData(){
        
        self.homeData?.loadBannerPic(callBlock: { (success) in
            self.cycleScrollView!.imageURLStringsGroup = self.homeData?.picArray
        })
        
    }
    
    func loadBtnData(){
        
        self.homeData?.loadBannerButton(callBlock: { (success) in
            
            for index in self.homeData!.buttonArray{
                
                let btnView = UIView.init(frame: CGRect(x: DEF_SCREEN_WIDTH/CGFloat(self.homeData!.buttonArray.count),y: 0,width: DEF_SCREEN_WIDTH/CGFloat(self.homeData!.buttonArray.count),height: 90))
                btnView.backgroundColor = UIColor.white
                self.addSubview(btnView)
                
                let picBtn = UIButton.init(type: .custom)
                picBtn.frame = CGRect(x: 0,y: 0,width: btnView.width,height: btnView.height)
//                let imageView = UIImageView()
//                ///网络获取头像并且显示
//                imageView.sd_setImage(with:NSURL.init(string: self.homeData!.buttonArray[index].icon_url), completed: { (uiimage, a, v, c) in
//                })
                picBtn.sd_setImage(with: NSURL.init(string: self.homeData!.buttonArray[index].icon_url), for: .normal, completed: { (uiimage, a, v, c) in
                    
                })

            }
            
        })
        
    }
    
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        if self.selectItems != nil {
            self.selectItems!(index)
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
