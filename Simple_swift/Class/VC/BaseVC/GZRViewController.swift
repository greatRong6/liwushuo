//
//  GZRViewController.swift
//  Simple_swift
//
//  Created by iosdev on 2019/4/19.
//  Copyright © 2019 gezhenrong. All rights reserved.
//

import UIKit

let titleHeight = CGFloat(44)
let titleWidth = CGFloat(65)

class GZRViewController: BaseVC,UIScrollViewDelegate {
    
//    var controllerArray:[UIViewController] = []
//    var titleArray:[String] = []
    var scrollView:UIScrollView!
    var selectButton:UIButton!
    var buttonArray:[UIButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setTitleArray(){
        
    }
    
    func initWithTitleButton(titleArray:Array<String>){

        let titleView:UIScrollView = UIScrollView.init(frame: CGRect(x: 0,y: 0,width: DEF_SCREEN_WIDTH,height: titleHeight))
        titleView.backgroundColor = UIColor.white
        titleView.showsVerticalScrollIndicator = false
        titleView.showsHorizontalScrollIndicator = false
        self.view.addSubview(titleView)

        for index in 0..<titleArray.count{
            
            let titleButton:UIButton = UIButton.init(type: .custom)
            titleButton.frame = CGRect(x: titleWidth*CGFloat(index),y: 0,width: titleWidth,height: titleHeight)
//            titleButton.backgroundColor = DefauleColor()
            titleButton.setTitle(titleArray[index], for: .normal)
            titleButton.setTitleColor(UIColor.black, for: .normal)
            titleButton.tag = 1000 + index
            titleButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            titleButton.addTarget(self, action: #selector(scrollViewSelectToIndex(button:)), for: .touchUpInside)
            titleView.addSubview(titleButton)
            
            if(index == 0){
                selectButton = titleButton;
                selectButton.setTitleColor(DefauleColor(), for: .normal)
//                selectButton.backgroundColor = UIColor.white
            }
            buttonArray.append(titleButton)
        }
        
        titleView.contentSize = CGSize(width: titleWidth * CGFloat(titleArray.count), height: titleHeight)
    }
    
    @objc func scrollViewSelectToIndex(button:UIButton){
        let index = button.tag - 1000
        self.selectClickButton(index: index)
    }
    
    func selectClickButton(index:NSInteger){
        self.view.endEditing(true);
        self.selectButton.setTitleColor(UIColor.black, for: .normal)
//        self.selectButton.backgroundColor = DefauleColor()
        self.selectButton = self.buttonArray[index]
        self.selectButton.setTitleColor(DefauleColor(), for: .normal)
//        self.selectButton.backgroundColor = UIColor.white
        UIView.animate(withDuration: 0.3) {
            self.scrollView.contentOffset = CGPoint(x: DEF_SCREEN_WIDTH*CGFloat(index), y: 0)
        }
        
    }
    
    func initWithController(controllerArray:Array<Any>){
        
        self.scrollView = UIScrollView.init(frame: CGRect(x: 0,y: titleHeight,width: DEF_SCREEN_WIDTH,height: DEF_SCREEN_HEIGHT - titleHeight - KNavigaHeight - KTabarHeight))
        self.scrollView.delegate = self
        self.scrollView.isPagingEnabled = true
        self.scrollView.isScrollEnabled = true
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.showsHorizontalScrollIndicator = false;
        self.scrollView.backgroundColor = UIColor.clear
        self.scrollView.contentSize = CGSize(width: DEF_SCREEN_WIDTH*CGFloat(controllerArray.count), height: 0)
        self.view.addSubview(self.scrollView)
        
        for index in 0..<controllerArray.count{
            let viewController:UIViewController = controllerArray[index] as! UIViewController
            viewController.view.frame = CGRect(x: DEF_SCREEN_WIDTH * CGFloat(index),y: 0,width: DEF_SCREEN_WIDTH,height: self.scrollView.height)
            scrollView.addSubview(viewController.view)
        }
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x / DEF_SCREEN_WIDTH
        self.selectClickButton(index: NSInteger(index))
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
