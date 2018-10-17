//
//  ViewController.swift
//  MyCodeBase
//
//  Created by moka-iOS on 2018/10/15.
//  Copyright © 2018 mybadge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnQQCopyAction(_ sender: UIButton) {
        let vc = QQNavChangeController.initVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

