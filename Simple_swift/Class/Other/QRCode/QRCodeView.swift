//
//  QRCodeView.swift
//  Simple_swift
//
//  Created by iosdev on 2018/4/17.
//  Copyright © 2018年 gezhenrong. All rights reserved.
//

import UIKit
import AVFoundation

enum ScanQRCodeType: Int {
    case qrCode = 1
    case barCode
}

let scanPicX = CGFloat(60)
private let scanAnimationDuration = 3.0//扫描时长

class QRCodeView: UIView,AVCaptureMetadataOutputObjectsDelegate {
    
    var scanSession :  AVCaptureSession?
    
    lazy var scanPane: UIImageView = {
        let scanPane = UIImageView.init(frame: CGRect(x: scanPicX, y: 100, width: DEF_SCREEN_WIDTH - scanPicX * 2, height: DEF_SCREEN_WIDTH - scanPicX * 2))
        scanPane.image = UIImage(named: "QRCode_ScanBox")
        return scanPane
    }()

    lazy var scanLine: UIImageView = {
        let scanLine = UIImageView.init(frame: CGRect(x: 0, y: 0, width: self.scanPane.bounds.width, height: 3))
        scanLine.image = UIImage(named: "QRCode_ScanLine")
        return scanLine
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layoutIfNeeded()
        
        self.addSubview(scanPane)
        scanPane.addSubview(scanLine)
        creatDataSource()
        
    }
    
    func creatDataSource(){
        
        do{
            //设置捕捉设备    //swift 4.0  代码有误
            let device = AVCaptureDevice.default(for: AVMediaType.video)
            //设置设备输入输出
            let input:AVCaptureInput = try AVCaptureDeviceInput(device: device!)
            
            let output = AVCaptureMetadataOutput()
            output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            
            //设置会话
            let  scanSession = AVCaptureSession()
            
            scanSession.canSetSessionPreset(AVCaptureSession.Preset.high)
            
            if scanSession.canAddInput(input){
                scanSession.addInput(input)
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
            scanPreviewLayer.frame = self.layer.bounds
            
            self.layer.insertSublayer(scanPreviewLayer, at: 0)
            
            //设置扫描区域
            NotificationCenter.default.addObserver(forName: NSNotification.Name.AVCaptureInputPortFormatDescriptionDidChange, object: nil, queue: nil, using: { (noti) in
                output.rectOfInterest = (scanPreviewLayer.metadataOutputRectConverted(fromLayerRect: self.scanPane.frame))
            })
            //保存会话
            self.scanSession = scanSession
            
        }catch{
            //摄像头不可用
//            UIAlertController.showAlert("提示", "摄像头不可用", self)
            return
        }
        
    }
    
    func startScan(){
        scanLine.layer.add(scanAnimation(), forKey: "scan")
        guard let scanSession = scanSession else { return }
        if !scanSession.isRunning{
            scanSession.startRunning()
        }
    }
    
    //扫描动画
    private func scanAnimation() -> CABasicAnimation{
        
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

    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        
        //停止扫描
        self.scanLine.layer.removeAllAnimations()
        self.scanSession!.stopRunning()
        
        //播放声音
        Utils.playAlertSound(sound: "noticeMusic.caf")
        
        //扫完完成
        if metadataObjects.count > 0
        {
            if let resultObj = metadataObjects.first as? AVMetadataMachineReadableCodeObject{
                
                print("sdskdksjd" + resultObj.stringValue! as Any);
                //继续扫描
                sleep(2)
                self.startScan()
                
            }
        }
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        //停止扫描
        self.scanLine.layer.removeAllAnimations()
        self.scanSession!.stopRunning()
        
        //播放声音
        Utils.playAlertSound(sound: "noticeMusic.caf")
        
        //扫完完成
        if metadataObjects.count > 0
        {
            if let resultObj = metadataObjects.first as? AVMetadataMachineReadableCodeObject{
                
                print("sdskdksjd" + resultObj.stringValue! as Any);
                //继续扫描
                self.startScan()
                
            }
        }
    }
    
    deinit{
        ///移除通知
        NotificationCenter.default.removeObserver(self)
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
