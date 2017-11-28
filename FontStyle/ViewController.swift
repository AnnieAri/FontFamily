//
//  ViewController.swift
//  FontStyle
//
//  Created by Ari on 2017/11/28.
//  Copyright © 2017年 Ari. All rights reserved.
//

import UIKit

class ARTableViewCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ARTableViewCell.self, forCellReuseIdentifier: "cell")
//        perform(#selector(snap), with: nil, afterDelay: 3)
    }
    
//    @objc func snap() {
//        let size = tableView.contentSize
//        UIGraphicsBeginImageContextWithOptions(size, true, UIScreen.main.scale)
//        guard let ctx = UIGraphicsGetCurrentContext() else {
//            print("没获取到上下文")
//            return
//        }
//        tableView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: size.height)
//        tableView.reloadData()
//        tableView.layer.render(in: ctx)
//        guard let image = UIGraphicsGetImageFromCurrentImageContext() else{return}
//        UIGraphicsEndImageContext()
//        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
//        print("保存完毕")
//    }
    
}
extension ViewController {
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 30))
        label.textColor = .black
        label.text = UIFont.familyNames[section]
        return label
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         return 30
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return UIFont.familyNames.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UIFont.fontNames(forFamilyName: UIFont.familyNames[section]).count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = UIFont.fontNames(forFamilyName: UIFont.familyNames[indexPath.section])[indexPath.row] + "中文样式"
        cell.detailTextLabel?.text = UIFont.fontNames(forFamilyName: UIFont.familyNames[indexPath.section])[indexPath.row]
        cell.textLabel?.font = UIFont(name: UIFont.fontNames(forFamilyName: UIFont.familyNames[indexPath.section])[indexPath.row], size: 16)!
        return cell
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
        print(scrollView.contentSize)
    }
}

