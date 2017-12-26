//
//  ViewController.swift
//  iOS8.0之后的的popover
//
//  Created by huangbiyong on 2017/12/26.
//  Copyright © 2017年 com.chase. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentPopover: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func openOrClose(_ sender: UISwitch) {
        
        if sender.isOn {
            // 1. 创建 UIViewController, 添加imageview
            let contentVC = UIViewController()
            let imageView = UIImageView(image: UIImage(named: "colorWheel"))
            imageView.isUserInteractionEnabled = true
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(pixColor(gester:)))
            imageView.addGestureRecognizer(tap)
            
            contentVC.view.addSubview(imageView)
            
            // 2. 设置模态的效果
            contentVC.modalPresentationStyle = .popover
            
            // 2.1 设置弹出的方向
            contentVC.popoverPresentationController?.sourceView = self.view
            contentVC.popoverPresentationController?.sourceRect = sender.frame
            
            // 2.2. 设置穿透视图(可以与用户交互的视图)
            contentVC.popoverPresentationController?.passthroughViews = [sender, self.view]
            
            // 2.3 设置背景颜色
            contentVC.popoverPresentationController?.backgroundColor = UIColor.white
            
            // 2.4 设置popover 显示大小
           contentVC.preferredContentSize = imageView.frame.size
            
            // 3. 直接弹出
            self.present(contentVC, animated: true, completion: nil)
            
            currentPopover = contentVC
        } else {
            currentPopover?.dismiss(animated: true)
        }
    
    }
    
    
    @objc func pixColor(gester: UITapGestureRecognizer) {
        let point = gester.location(in: gester.view)
        
        let imageView = gester.view as? UIImageView
        
        guard let image = imageView?.image else {
            return
        }
        
        let color = image.pixelColor(atLocation: point)
        
        view.backgroundColor = color
        
    }
    


}

