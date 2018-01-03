//
//  LoadWebVC.swift
//  Simple_swift
//
//  Created by greatRong on 2017/12/26.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit

class LoadWebVC: BaseVC,UIWebViewDelegate {
    
    var webView:UIWebView?
    var urlStr:String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.urlStr = "https://www.baidu.com/"
        self.creatUI()

        // Do any additional setup after loading the view.
    }
    
    func creatUI(){
        
        self.webView = UIWebView.init(frame: CGRect(x: 0,y: 0, width: DEF_SCREEN_WIDTH,height: DEF_SCREEN_HEIGHT - CGFloat(KNavigaHeight)))
        self.webView?.delegate = self
        self.view.addSubview(self.webView!)
        
        let urlR = URLRequest.init(url: URL.init(string: self.urlStr)!)
        self.webView?.loadRequest(urlR)
        
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        self.title = self.webView?.stringByEvaluatingJavaScript(from: "document.title")
    
//        if (self.title?.count)! > 7{
//            self.title = self.title.subscriptEnd
//        }
        
        return true
        
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
