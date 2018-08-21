//
//  ViewController.swift
//  ButtonWithIndicator
//
//  Created by Akihiko Okubo on 2018/08/20.
//  Copyright © 2018年 akihiko.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: IndicatorButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.borderColor = UIColor(red: 229.0 / 255.0, green: 0.0 / 255.0, blue: 45.0 / 255.0, alpha: 1.0).cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // インジケータ表示
        button.isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            // 3sec経ったらインジケータ非表示
            self.button.isLoading =  false
        }
    }
}

