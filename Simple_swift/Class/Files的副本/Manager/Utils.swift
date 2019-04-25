//
//  Utils.swift
//  Simple_swift
//
//  Created by iosdev on 2018/4/17.
//  Copyright © 2018年 gezhenrong. All rights reserved.
//

import Foundation
import AVFoundation
import Photos

public struct Utils{
    
    /**
     检查相机授权状态
     
     - parameter success:     授权成功
     - parameter failure:     授权失败
     
     - returns: Void
     */
    public static func jm_cameraAuthStatus(success: (()->())?, failure: (()->())?) {
            if let _ = AVCaptureDevice.default(for: AVMediaType.video) {
                let status = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
            
            switch status {
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (granted) in
                    if granted {
                        DispatchQueue.main.async {
                            /// 第一次询问用户允许当前应用访问相机
                            success?()
                        }
                    }else {
                        /// 第一次询问用户不允许当前应用访问相机
                        failure?()
                    }
                })
            case .authorized:
                /// 用户允许当前应用访问相机
                success?()
            case .denied, .restricted:
                /// 用户不允许当前应用访问相机
                failure?()
            }
        }else {
            let alertVC = UIAlertController.init(title: "提示", message: "未检测到您的摄像头, 请在真机上测试", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction.init(title: "确定", style: .destructive, handler: { (action) in
                
            }))
            
            UIApplication.shared.keyWindow?.rootViewController?.present(alertVC, animated: true, completion: nil)
        }
    }
    
    /**
     检查相册授权状态
     
     - parameter success:     授权成功
     - parameter failure:     授权失败
     
     - returns: Void
     */
    public static func jm_albumAuthStatus(success: (()->())?, failure: (()->())?) {
        if let _ = AVCaptureDevice.default(for: AVMediaType.video) {
            let status = PHPhotoLibrary.authorizationStatus()
            
            switch status {
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization({ (status) in
                    if status == .authorized  {
                        DispatchQueue.main.async {
                            /// 第一次询问用户允许当前应用访问相册
                            success?()
                        }
                    }else {
                        /// 第一次询问用户不允许当前应用访问相册
                        failure?()
                    }
                })
            case .authorized:
                /// 用户允许当前应用访问相册
                success?()
            case .denied, .restricted:
                /// 用户不允许当前应用访问相册
                failure?()
            }
        }else {
            failure?()
        }
    }
    
    
    static func playAlertSound(sound:String){
        
        guard let soundPath = Bundle.main.path(forResource: sound, ofType: nil)  else { return }
        guard let soundUrl = NSURL(string: soundPath) else { return }
        
        var soundID:SystemSoundID = 0
        AudioServicesCreateSystemSoundID(soundUrl, &soundID)
        AudioServicesPlaySystemSound(soundID)
        
    }

    
}
