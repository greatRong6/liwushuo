//
//  ScanVC.swift
//  Simple_swift
//
//  Created by iosdev on 2017/12/11.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit
import AVFoundation
//播放声音需要的框架
import AudioToolbox

class ScanVC: BaseVC, UIImagePickerControllerDelegate,UINavigationControllerDelegate,HandleTheResultDelegate {
    
    var readView : QRCodeReaderView?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "二维码"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "相册", style: .done, target: self, action: #selector(openLocalPhotoAlbum))

        self.initScan()
        
        // Do any additional setup after loading the view.
    }
    
    @objc func openLocalPhotoAlbum() {
        let picker = UIImagePickerController()
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image:UIImage? = info[UIImagePickerControllerEditedImage] as? UIImage
        //识别二维码
        if image != nil {
            let detector:CIDetector = CIDetector(ofType: CIDetectorTypeQRCode, context: nil, options: [CIDetectorAccuracy:CIDetectorAccuracyHigh])!
            let img = CIImage(cgImage: (image?.cgImage)!)
            let features : [CIFeature]? = detector.features(in: img, options: [CIDetectorAccuracy:CIDetectorAccuracyHigh])
            if features != nil && (features?.count)! > 0 {
                let feature = features![0]
                if feature.isKind(of: CIQRCodeFeature.self)
                {
                    let featureTmp:CIQRCodeFeature = feature as! CIQRCodeFeature
                    
                    let scanResult = featureTmp.messageString
                    self.handleResult(scanResult!)
                }
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    //加载扫描框
    func initScan() {
        let authorStaus = AVCaptureDevice.authorizationStatus(for: .video)
        if [authorStaus == .restricted, authorStaus == .denied].contains(true){
            UIAlertController.showAlertView("提示", "相机权限受限，请在设置->隐私->相机 中进行设置！", .GZRAlertStyleAlert, "取消", ["确定"], self, complete: { (index) in
                if index as! Decimal == 1{
                    let url = NSURL.init(string: UIApplicationOpenSettingsURLString)
                    if UIApplication.shared.canOpenURL(url! as URL) {
                        UIApplication.shared.openURL(url! as URL)
                    }
                }
            })
            return
        }
        
        if self.readView != nil{
            self.readView?.removeFromSuperview()
            self.readView = nil
        }
        self.readView = QRCodeReaderView.init(frame: CGRect(x: 0,y: 0,width: DEF_SCREEN_WIDTH,height: DEF_SCREEN_HEIGHT))
        self.readView?.delegate = self
        self.readView?.puinMyCodeController = {() in
            //进入我的二维码界面
            let mineQR = MineQRCodeViewController()
            self.navigationController?.pushViewController(mineQR, animated: true)
        }
        self.readView?.backgroundColor = UIColor.white
        self.view.addSubview(self.readView!)
    }
    
    //重新扫描的方法
    func reStartScan() {
        if self.readView?.scanType != .barCode {
            self.readView?.creatDrawLine()
            self.readView?.startLineAnimation()
        }
        self.readView?.start()
    }
    
    //View将要出现的时候重新扫描
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.readView != nil {
            self.reStartScan()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if self.readView != nil {
            self.readView?.stop()
        }
    }
    
    //处理扫描结果
    func handleResult(_ result: String) {
        print("处理扫描结果\(result)")
        UIAlertController.showAlert("提示", result, self)
    }
    
    //MARK:----HandleTheResultDelegate
    func handelTheResult(_ metadataObjectString: String) {
        //停止扫描
        self.readView?.stop()
        //播放扫描二维码的声音
        //这个只能播放不超过30秒的声音，它支持的文件格式有限，具体的说只有CAF、AIF和使用PCM或IMA/ADPCM数据的WAV文件
        //声音地址
        let path = Bundle.main.path(forResource: "noticeMusic", ofType: "wav")
        //建立的systemSoundID对象
        var soundID : SystemSoundID = 0
        let baseURL = URL(fileURLWithPath: path!)
        //赋值
        AudioServicesCreateSystemSoundID(baseURL as CFURL, &soundID)
        //播放声音
        AudioServicesPlaySystemSound(soundID)
        
        //如果是提醒的话
        
        //处理扫描结果
        self.handleResult(metadataObjectString)
        
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


