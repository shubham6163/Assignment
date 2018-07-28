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
        let dataList = [
            Alamofire.request("https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json").validate(statusCode: 200..<300).responseJSON { response in
                switch response.result {
                case .success:
                    if response.result.value != nil {
                        let json = JSON(response.result.value!)
                        for results in json["rows"].arrayValue {
                            TableData(title: "\(String(describing: results["title"]))", descripsion: "\(String(describing: results["description"]))", imageHref: "\(String(describing: results["imageHref"]))")
                        }
                    }
                case .failure( _): break
                    
                }
            }
        ]
        return dataList
    }
    
}

