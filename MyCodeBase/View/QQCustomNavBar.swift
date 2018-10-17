//
//  QQCustomNavBar.swift
//  MyCodeBase
//
//  Created by moka-iOS on 2018/10/17.
//  Copyright © 2018 mybadge. All rights reserved.
//

import UIKit


class QQCustomNavBar: UIView {
    
    var title = "" {
        didSet {
            lbTitle.text = title
        }
    }
    var titleColor: UIColor? {
        didSet {
            lbTitle.textColor = titleColor
        }
    }
    
    var leftImageName: String? {
        didSet {
            if let name = leftImageName {
                btnLeft.setImage(UIImage(named: name), for: .normal)
            }
        }
    }
    var rightImageName: String? {
        didSet {
            if let name = rightImageName {
                btnRight.setImage(UIImage(named: name), for: .normal)
            }
        }
    }
    
    @IBOutlet private weak var btnLeft: UIButton!
    @IBOutlet private weak var btnRight: UIButton!
    @IBOutlet private weak var lbTitle: UILabel!
    
    var backActionClosure: (()->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let size: CGSize
        if ScreenH == 812 {
            size = CGSize(width: ScreenW, height: 88)
        } else {
            size = CGSize(width: ScreenW, height: 64)
        }
        self.bounds = CGRect(origin: CGPoint.zero, size: size)
    }
    
    class func initNav() -> QQCustomNavBar {
        if let v = Bundle.main.loadNibNamed("QQCustomNavBar", owner: nil, options: nil)?.last as? QQCustomNavBar {
            v.leftImageName = "Mail"
            v.rightImageName = "Setting"
            v.titleColor = UIColor.white
            v.backgroundColor = UIColor.white.withAlphaComponent(0)
            return v
        }
        return QQCustomNavBar()
    }
    
    @IBAction func btnLeftAction(_ sender: UIButton) {
        backActionClosure?()
    }
}
