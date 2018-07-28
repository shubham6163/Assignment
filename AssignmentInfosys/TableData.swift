//
//  TableData.swift
//  AssignmentInfosys
//
//  Created by Shubham Goswami on 28/07/18.
//  Copyright © 2018 Shubham Goswami. All rights reserved.
//

import UIKit

class TableData: NSObject {
    
    let title: String
    let descripsion: String
    let imageHref: String
    
    init(title: String, descripsion: String, imageHref: String) {
        self.title = title
        self.descripsion = descripsion
        self.imageHref = imageHref
    }
    
}
