//
//  QQNavChangeController.swift
//  MyCodeBase
//
//  Created by moka-iOS on 2018/10/15.
//  Copyright © 2018 mybadge. All rights reserved.
//

import UIKit

let ScreenW = UIScreen.main.bounds.size.width
let ScreenH = UIScreen.main.bounds.size.height

class QQNavChangeController: BaseViewController {

    /// 视图宽高比
    var ratio: CGFloat = 750.0/415.0
    var headHeight: CGFloat!
    
    let navBar = QQCustomNavBar.initNav()
    
    @IBOutlet weak var headerBgImgv: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .clear
        navigationController?.setNavigationBarHidden(true, animated: true)
        headHeight = ScreenW/ratio
        navBar.backActionClosure = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        self.view.addSubview(navBar)
        let view = UIView(frame: CGRect(x: 0, y: 0, width: ScreenW, height: headHeight-navBar.frame.size.height))
        view.backgroundColor = .clear
        
        
        tableView.tableHeaderView = view
        tableView.tableFooterView = UIView()
        tableView.showsVerticalScrollIndicator = false
        
        //tableView.panGestureRecognizer.require(toFail: (navigationController?.interactivePopGestureRecognizer)!)
    }
    

    override static func storyBoardName() -> StoryBoardName {
        return .main
    }

}

// MARK: - tableView 数据源
extension QQNavChangeController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = "mybadge\(indexPath.row+1)"
        cell.detailTextLabel?.text = ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension QQNavChangeController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        print("offsetY=\(offsetY)")
        let h = tableView.tableHeaderView!.frame.size.height
        if offsetY < h {   //当我滑动到导航栏底部之前
            
            let colorAlpha = offsetY/h
            navBar.backgroundColor = UIColor.white.withAlphaComponent(colorAlpha)
            navBar.leftImageName = "Mail"
            navBar.rightImageName = "Setting"
            navBar.titleColor = UIColor.white
            
        } else {
            //超过导航栏底部了
            navBar.backgroundColor = UIColor.white
            navBar.leftImageName = "Mail-click"
            navBar.rightImageName = "Setting-click"
            navBar.titleColor = UIColor(displayP3Red: 87/255.0, green: 173/255.0, blue: 104/255.0, alpha: 1)
        }
        
        if offsetY < 0 {
            let h = headHeight - offsetY
            headerBgImgv.frame = CGRect(x: -(h*ratio-ScreenW)/2, y: 0, width: h*ratio, height: h)
        } else {
            headerBgImgv.frame = CGRect(x: 0, y: 0, width: ScreenW, height: headHeight)
        }
    }
}
