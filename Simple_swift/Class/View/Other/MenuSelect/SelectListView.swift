//
//  SelectListView.swift
//  Simple_swift
//
//  Created by iosdev on 2019/5/8.
//  Copyright © 2019 gezhenrong. All rights reserved.
//

import UIKit

class SelectListView: UIView,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView?
    var dataSource:[ChannelsData] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = RGBA(r: 0, g: 0, b: 0, a: 0.5)
//        self.alpha = 0
        
        let backView = UIView.init(frame: CGRect(x: 0,y: 0,width: DEF_SCREEN_WIDTH,height: 200))
        backView.backgroundColor = UIColor.white
        self.addSubview(backView)
        
        tableView = UITableView.init(frame: CGRect(x: 0,y: 0,width: backView.width,height: backView.height), style: .plain)
        tableView?.delegate = self;
        tableView?.dataSource = self
        backView.addSubview(tableView!)
        
        LoadCellClass(view: tableView!, className: SelectListCell.self, name: "SelectListCell")
        
    }
    
    func initWithData(titleArray:Array<ChannelsData>){
        
        dataSource.removeAll()
        
        dataSource = titleArray
        tableView?.reloadData()
        
    }
    
    func showView(){
        
        UIApplication.shared.keyWindow?.addSubview(self)
        UIView.animate(withDuration: 0.3) {
            var frame = self.frame
            frame.origin.y = DEF_SCREEN_HEIGHT - frame.size.height
            self.frame = frame
            self.alpha = 1
            
        }
        
    }
    
    func cancleView(){
        
        UIView.animate(withDuration: 0.1, animations: {
            
            var frame = self.frame
            frame.origin.y = 0
            self.frame = frame
            self.alpha = 0

        }) { (finish) in
            
            self.removeFromSuperview()
            
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.cancleView()
    }
    
    @objc func titleButtonClick(button:UIButton){
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectListCell") as! SelectListCell
        cell.initWithData(titleModel: dataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.cancleView()
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
