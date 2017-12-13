//
//  ScanVC.swift
//  Simple_swift
//
//  Created by iosdev on 2017/12/11.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit
import AVFoundation

private let scanAnimationDuration = 3.0//扫描时长

class ScanVC: BaseVC {
    
    var scanPane: UIImageView!///扫描框
    var activityIndicatorView: UIActivityIndicatorView!
    var bottomView : UIView?
    var lightOn = false//开光灯
    var scanSession :  AVCaptureSession?
    var videoInput : AVCaptureDeviceInput?
    
    lazy var scanLine : UIImageView = {
        let scanLine = UIImageView()
        scanLine.frame = CGRect(x: 0, y: 0, width: self.scanPane.bounds.width, height: 3)
        scanLine.image = UIImage(named: "QRCode_ScanLine")
        return scanLine
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initSubViews()
        setupScanSession()
        // Do any additional setup after loading the view.
    }
    
    private func initSubViews() {
        
        let label: UILabel = UILabel.init()
        label.frame = CGRect(x: 10,y: 100,width: DEF_SCREEN_WIDTH - 20,height: 20)
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
        label.text = "将取景框对准二维/条形码，即可自动扫描"
        self.view.addSubview(label)
        
        scanPane = UIImageView.init(image: UIImage.init(named: "QRCode_ScanBox"))
        scanPane.frame = CGRect(x: 74.5,y: 200,width: 226,height: 188)
        self.view.addSubview(scanPane)
        
        activityIndicatorView = UIActivityIndicatorView.init()
        activityIndicatorView.frame = CGRect(x: DEF_SCREEN_WIDTH/2 - 15,y: DEF_SCREEN_HEIGHT/2 - 15,width: 30,height: 30)
        activityIndicatorView.color = UIColor.orange
        self.view.addSubview(activityIndicatorView)
        
        initBottomView()
        view.layoutIfNeeded()
        scanPane.addSubview(scanLine)
    }
    
    private func initBottomView() {
        
        bottomView = {
            let tempbottomView = UIView.init(frame: CGRect(x: 0.0, y: DEF_SCREEN_HEIGHT - CGFloat(KNavigaHeight) - 20.0, width: DEF_SCREEN_WIDTH, height: 2 * CGFloat(KNavigaHeight)))
            tempbottomView.backgroundColor = DefauleColor()
            view.addSubview(tempbottomView)
            return tempbottomView
        }()
        
        let imageViewWidth:CGFloat = DEF_SCREEN_WIDTH/3
        for index in 0...3 {
            let imageView = UIImageView.init()
            imageView.tintColor = UIColor.white
            imageView.isUserInteractionEnabled = true
            imageView.frame = CGRect(x: imageViewWidth * CGFloat(index), y: 10, width: imageViewWidth, height: ((bottomView?.frame.size.height)!/2))
            
            if index == 0 {
                imageView.image = UIImage.init(named: "qrcode_scan_btn_photo_nor")
                
            } else if index == 1 {
                imageView.image = UIImage.init(named: "qrcode_scan_btn_flash_nor")
                
            }else if index == 2 {
                imageView.image = UIImage.init(named: "qrcode_scan_btn_myqrcode_nor")
                
            }
            
            imageView.contentMode = .center;
            
            let button: UIButton = UIButton.init()
            button.frame = CGRect(x: 0, y: 0, width: imageViewWidth, height: imageView.frame.size.height)
            button.backgroundColor = UIColor.clear
            button.addTarget(self, action: #selector(bottomBtnClick(sender:)), for: .touchUpInside)
            button.tag = index
            imageView.addSubview(button)
            bottomView?.addSubview(imageView)
            
        }
    }
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        startScan()
    }
    func setupScanSession()
    {
        do
        {
            //设置捕捉设备
//            let device = AVCaptureDevice.default(for: AVMediaType.video)
            //设置设备输入输出
            do {
                self.videoInput = try AVCaptureDeviceInput.init(device: self.getBackDevice()!)
            } catch {}
            
            let output = AVCaptureMetadataOutput()
            output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            
            //设置会话
            let  scanSession = AVCaptureSession()
            scanSession.canSetSessionPreset(AVCaptureSession.Preset.high)
            
            if scanSession.canAddInput(videoInput!){
                scanSession.addInput(videoInput!)
            }
            
            if scanSession.canAddOutput(output){
                scanSession.addOutput(output)
            }
            
            //设置扫描类型(二维码和条形码)
            output.metadataObjectTypes = [
                AVMetadataObject.ObjectType.qr,
                AVMetadataObject.ObjectType.code39,
                AVMetadataObject.ObjectType.code128,
                AVMetadataObject.ObjectType.code39Mod43,
                AVMetadataObject.ObjectType.ean13,
                AVMetadataObject.ObjectType.ean8,
                AVMetadataObject.ObjectType.code93]
            
            //预览图层
            let scanPreviewLayer = AVCaptureVideoPreviewLayer(session:scanSession)
            scanPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            scanPreviewLayer.frame = view.layer.bounds
            
            view.layer.insertSublayer(scanPreviewLayer, at: 0)
            
            //设置扫描区域
            NotificationCenter.default.addObserver(forName: NSNotification.Name.AVCaptureInputPortFormatDescriptionDidChange, object: nil, queue: nil, using: { (noti) in
                output.rectOfInterest = (scanPreviewLayer.metadataOutputRectConverted(fromLayerRect: self.scanPane.frame))
            })
            //保存会话
            self.scanSession = scanSession
        }
        catch{
            //摄像头不可用
            UIAlertController .showAlert("温馨提示", "摄像头不可用", self);
            return
        }
    }
    //MARK:设置捕捉设备
    func getBackDevice() -> AVCaptureDevice?{
        let devices :[AVCaptureDevice] = AVCaptureDevice.devices()
        for device in devices{
            if device.hasMediaType(AVMediaType.video){
                if device.position == .back //表示设备的物理位置在系统硬件上的背面。
                {
                    NSLog("Device position : back");
                    return device
                }else
                {
                    NSLog("Device position : front");
                }
            }
        }
        return nil
    }
    
    @objc func bottomBtnClick(sender: UIButton) {
        
        switch sender.tag {
        case 0:
            photo()
            break
        case 1:
            light(sender)
            break
        case 2: break
            //            let vc2:MyQRCodeViewController = MyQRCodeViewController()
            //            self.navigationController?.pushViewController(vc2, animated: false)
            
        default:
            print("\(sender.tag)")
            
        }
    }
    //MARK:相册
    func photo(){
        //        Tool.shareTool.choosePicture(self, editor: true, options: .photoLibrary) {[weak self] (image) in
        //
        //            self!.activityIndicatorView.startAnimating()
        //
        //            DispatchQueue.global().async {
        //                let recognizeResult = image.recognizeQRCode()
        //                let result = recognizeResult?.characters.count > 0 ? recognizeResult : "无法识别"
        //                DispatchQueue.main.async {
        //                    self!.activityIndicatorView.stopAnimating()
        //                    Tool.confirm(title: "扫描结果", message: result, controller: self!)
        //                }
        //            }
        //        }
    }
    
    //MARK:闪光灯
    func light(_ sender: UIButton){
        
        lightOn = !lightOn
        sender.isSelected = lightOn
        turnTorchOn()
    }
    //MARK:开始扫描
    fileprivate func startScan()
    {
        
        scanLine.layer.add(scanAnimation(), forKey: "scan")
        
        guard let scanSession = scanSession else { return }
        
        if !scanSession.isRunning
        {
            scanSession.startRunning()
        }
        
        
    }
    //MARK:扫描动画
    private func scanAnimation() -> CABasicAnimation
    {
        
        let startPoint = CGPoint(x: scanLine .center.x  , y: 1)
        let endPoint = CGPoint(x: scanLine.center.x, y: scanPane.bounds.size.height - 2)
        
        let translation = CABasicAnimation(keyPath: "position")
        translation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        translation.fromValue = NSValue(cgPoint: startPoint)
        translation.toValue = NSValue(cgPoint: endPoint)
        translation.duration = scanAnimationDuration
        translation.repeatCount = MAXFLOAT
        translation.autoreverses = true
        
        return translation
    }
    
    
    //MARK:闪光灯
    private func turnTorchOn()
    {
        
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else
        {
            if lightOn{
                UIAlertController .showAlert("温馨提示", "闪光灯不可用", self)
            }
            return
        }
        
        if device.hasTorch
        {
            do
            {
                try device.lockForConfiguration()
                
                if lightOn && device.torchMode == .off
                {
                    device.torchMode = .on
                }
                
                if !lightOn && device.torchMode == .on
                {
                    device.torchMode = .off
                }
                
                device.unlockForConfiguration()
            }
            catch{ }
            
        }
        
    }
    deinit
    {
        ///移除通知
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

//扫描捕捉完成
extension ScanVC : AVCaptureMetadataOutputObjectsDelegate
{
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!)
    {
        
        //停止扫描
        self.scanLine.layer.removeAllAnimations()
        self.scanSession!.stopRunning()
        
        //播放声音
        //        Tool.playAlertSound(sound: "noticeMusic.caf")
        
        //扫完完成
        if metadataObjects.count > 0
        {
            
            if (metadataObjects.first as? AVMetadataMachineReadableCodeObject) != nil
            {
                
                //                Tool.confirm(title: "扫描结果", message: resultObj.stringValue, controller: self,handler: { (_) in
                //                    //继续扫描
                //                    self.startScan()
                //                })
                
            }
            
        }
        
    }
    
}

