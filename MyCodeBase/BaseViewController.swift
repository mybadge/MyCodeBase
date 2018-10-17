//
//  BaseViewController.swift
//  CreatVCDemo
//
//  Created by 赵志丹 on 2018/8/11.
//  Copyright © 2018年 mybadge. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, StoryBoardProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    class func storyBoardName() -> StoryBoardName {
        return .none
    }
    

}
