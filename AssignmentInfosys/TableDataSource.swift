//
//  TableDataSource.swift
//  AssignmentInfosys
//
//  Created by Shubham Goswami on 28/07/18.
//  Copyright © 2018 Shubham Goswami. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TableDataSource: NSObject {
    
    class func dataList() -> [TableData] {
        var dataList = [TableData]()
        let headers = [
            "Accept": "*/*",
            "Content-Type": "application/json"
        ]
        Alamofire.request("https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json",headers: headers).responseJSON { response in
            if response.result.value != nil {
                let json = JSON(response.result.value!)
                print(json)
                for results in json["rows"].arrayValue {
                    dataList.append(TableData(title: "\(String(describing: results["title"]))", descripsion: "\(String(describing: results["description"]))", imageHref: "\(String(describing: results["imageHref"]))"))
                }
            }
        }
        return dataList
    }
    
}

