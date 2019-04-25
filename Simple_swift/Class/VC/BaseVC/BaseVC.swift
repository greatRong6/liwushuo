//
//  BaseVC.swift
//  Simple_swift
//
//  Created by greatRong on 2017/12/7.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    
    override func viewWillDisappear(_ animated:Bool) {
        super.viewWillDisappear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true;
    }
    
    override func viewDidAppear(_ animated:Bool) {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = RGB(r: 230, g: 230, b: 230)
        
        let leftBtn = UIButton.init(type: .custom)
        leftBtn.frame = CGRect(x: 0,y: 0, width: 20,height: 20)
        leftBtn.setImage(UIImage.init(named: "leftBtn"), for: .normal)
        leftBtn.addTarget(self, action: #selector(leftClick), for: .touchUpInside)
        let leftBarItem = UIBarButtonItem.init(customView: leftBtn);
        self.navigationItem.leftBarButtonItem = leftBarItem
        
        // Do any additional setup after loading the view.
    }
    
    @objc func leftClick() {
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("\(self.debugDescription) 销毁")
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
