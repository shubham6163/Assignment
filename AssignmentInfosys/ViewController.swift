//
//  ViewController.swift
//  AssignmentInfosys
//
//  Created by Shubham Goswami on 28/07/18.
//  Copyright © 2018 Shubham Goswami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate let tableCellReuseIdentifier = "DataTableViewCellIdentifier"
    fileprivate let dataList = TableDataSource.dataList()
    fileprivate let tableview = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Images"
        configureTableView()
    }
    
    func configureTableView() {
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: tableCellReuseIdentifier, for: indexPath) as! DataCell
        let data = dataList[(indexPath as NSIndexPath).row]
        cell.titleLabel.text = data.title
        cell.detailLabel.text = data.descripsion
        return cell
    }
}
