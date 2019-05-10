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
    var selectBtnItems:((_ index:Int,_ urlStr:String) ->())?
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
            
            for index in 0..<self.homeData!.buttonArray.count{
                
                let btnView = UIView.init(frame: CGRect(x: DEF_SCREEN_WIDTH/CGFloat(self.homeData!.buttonArray.count)*CGFloat(index),y: (DEF_SCREEN_WIDTH*9)/16,width: DEF_SCREEN_WIDTH/CGFloat(self.homeData!.buttonArray.count),height: 95))
                btnView.backgroundColor = UIColor.white
                self.addSubview(btnView)
                
                let picBtn = UIButton.init(type: .custom)
                picBtn.frame = CGRect(x: (btnView.width-60)/2,y: 5,width: 60,height: 60)
                picBtn.sd_setImage(with: URL(string: (self.homeData?.buttonArray[index].icon_url)!), for: .normal, placeholderImage: UIImage(named: "nopic.jpg"))
                picBtn.tag = 100 + index
                picBtn.addTarget(self, action: #selector(self.picClick(button:)), for: .touchUpInside)
                btnView.addSubview(picBtn)
                
                let titleL = UILabel.init(frame: CGRect(x: 0,y: picBtn.maxY,width: btnView.width,height: 30))
                titleL.text = self.homeData?.buttonArray[index].title
                titleL.font = UIFont.systemFont(ofSize: 14)
                titleL.textAlignment = .center
                btnView.addSubview(titleL)
                
            }
            
        })
        
    }
    
    @objc func picClick(button:UIButton){
        let inde = button.tag - 100
        selectBtnItems!(inde,(self.homeData?.buttonArray[inde].target_url)!)
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
