//
//  ViewController.swift
//  AssignmentInfosys
//
//  Created by Shubham Goswami on 28/07/18.
//  Copyright © 2018 Shubham Goswami. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    fileprivate let tableCellReuseIdentifier = "DataTableViewCellIdentifier"
    fileprivate let dataList = TableDataSource.dataList()
    fileprivate let tableview = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Images"
        configureTableView()
    }
    
    public func configureTableView() {
        tableview.dataSource = self
        tableview.estimatedRowHeight = 100
        tableview.rowHeight = UITableViewAutomaticDimension
        tableview.register(DataCell.self, forCellReuseIdentifier: tableCellReuseIdentifier)
        
        view.addSubview(tableview)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: tableCellReuseIdentifier, for: indexPath) as! DataCell
        let data = dataList[(indexPath as NSIndexPath).row]
        let url = URL(string: data.imageHref)
        cell.imageView?.kf.indicatorType = .activity
        cell.imageView?.layer.cornerRadius = (cell.imageView?.bounds.height)! / 10
        
        cell.imageView?.clipsToBounds = true
        cell.imageView?.kf.setImage(with: url,
                                     placeholder: nil,
                                     options: [.transition(.fade(1))],
                                     progressBlock: { receivedSize, totalSize in
        },
                                     completionHandler: { image, error, cacheType, imageURL in
        })
        cell.titleLabel.text = data.title
        cell.detailLabel.text = data.descripsion
        return cell
    }
}
