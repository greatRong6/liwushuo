//
//  PagingViewTableHeaderView.swift
//  JXPagingView
//
//  Created by jiaxin on 2018/5/28.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

import UIKit

class PagingViewTableHeaderView: UIView {
    
    var imageView: UIImageView!
    var imageViewFrame: CGRect!
    var picImage: UIImageView!
    var nameL: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)

        imageView = UIImageView(image: UIImage(named: "mine_back"))
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        imageView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(imageView)
        
        picImage = UIImageView.init(frame: CGRect(x: frame.size.width/2-35,y: frame.size.height/2-35,width: 75,height: 75))
        picImage.image = UIImage.init(named: "mine_head")
        self.addSubview(picImage)
        
        nameL = UILabel.init(frame: CGRect(x: 0,y: picImage.maxY+5,width: DEF_SCREEN_WIDTH,height: 20))
        nameL.text = "haha"
        nameL.font = UIFont.systemFont(ofSize: 14)
        nameL.textColor = UIColor.white
        nameL.textAlignment = .center
        self.addSubview(nameL)

    }

    override func layoutSubviews() {
        super.layoutSubviews()

        imageViewFrame = bounds
    }

    func scrollViewDidScroll(contentOffsetY: CGFloat) {
        var frame = imageViewFrame!
        frame.size.height -= contentOffsetY
        frame.origin.y = contentOffsetY
        imageView.frame = frame
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
