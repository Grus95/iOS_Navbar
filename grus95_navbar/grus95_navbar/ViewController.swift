//
//  ViewController.swift
//  grus95_navbar
//
//  Created by 劳鸣鹤 on 2017/3/1.
//  Copyright © 2017年 grus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let kScreenW = UIScreen.main.bounds.width
    let kScreenH = UIScreen.main.bounds.height
    var navbarList = [String]()
    
    func getData () -> Void {
        for item in 0..<20 {
            navbarList.append("标题" + String(item))
        }
    }
    
    func btnClick(sender:UIButton) {
        print("点击了标题\(sender.tag)")
    }
    
    func showNavbar(list: [String]) -> Void {
        var allWidth = 5
        let svNavbar = UIScrollView()
        svNavbar.frame = CGRect.init(x: 0, y: 80, width: self.kScreenW, height: 50)
        svNavbar.showsHorizontalScrollIndicator = false
        svNavbar.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        for item in 0..<list.count {
            let titleName = list[item]
            let nub = titleName.lengthOfBytes(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
            let baseWidth = 12*nub
            let btnText = UIButton(frame: CGRect.init(x: allWidth, y: 10, width: baseWidth, height: 30))
            btnText.tag = item
            btnText.setTitle(titleName, for: .normal)
            btnText.setTitleColor(UIColor(red: 5/255, green: 165/255, blue: 209/255, alpha: 1), for: .normal)
            btnText.addTarget(self, action: #selector(btnClick(sender:)), for:
                .touchUpInside)
            svNavbar.contentSize = CGSize.init(width: item*baseWidth, height: 50)
            svNavbar.addSubview(btnText)
            allWidth = baseWidth + allWidth
            
        }
        self.view.addSubview(svNavbar)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        showNavbar(list: self.navbarList)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

