//
//  ViewController.swift
//  EWAddressPicker
//
//  Created by Ethan.Wang on 2018/8/30.
//  Copyright © 2018年 Ethan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 250, width: UIScreen.main.bounds.width - 100, height: 50))
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = UIColor(red: 255/255.0, green: 51/255, blue: 102/255, alpha: 1)
        return label
    }()
    let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 450, width: UIScreen.main.bounds.width - 200, height: 50))
        button.addTarget(self, action: #selector(onClickSelectButton), for: .touchUpInside)
        button.setTitleColor(UIColor(red: 255/255, green: 51/255, blue: 102/255, alpha: 1), for: .normal)
        button.setTitle("选择地址", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(label)
        self.view.addSubview(button)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc func onClickSelectButton() {
        let addressPicker = EWAddressViewController( selectProvince: "上海市", selectCity: "" )
        /*** 可使用这种init方法自定制选中颜色,不填写selectColor默认颜色为UIColor(red: 79/255, green: 176/255, blue: 255/255, alpha: 1),蓝色
        let addressPicker = EWAddressViewController(selectColor: UIColor.yellow)
         */
        // 返回选择数据,地址,省,市,区
        addressPicker.backLocationStringController = { (address,province,city,area) in
            self.label.text = address
        }
        self.present(addressPicker, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
