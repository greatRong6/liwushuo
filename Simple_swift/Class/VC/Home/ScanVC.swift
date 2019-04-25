//
//  ScanVC.swift
//  Simple_swift
//
//  Created by iosdev on 2017/12/11.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit

class ScanVC: BaseVC{
    
    var qrCode:QRCodeView?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "二维码"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "相册", style: .done, target: self, action: #selector(openLocalPhotoAlbum))
        setupViews()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.qrCode?.startScan()
    }
    
    @objc func openLocalPhotoAlbum(){
        
    }
    
    func setupViews(){
        
        self.qrCode = QRCodeView.init(frame: CGRect(x: 0,y: 0,width: DEF_SCREEN_WIDTH,height: DEF_SCREEN_HEIGHT))
        self.view.addSubview(self.qrCode!)
        
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


