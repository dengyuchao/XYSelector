//
//  XYSectorModel.swift
//  XYSelector
//
//  Created by dengyuchao on 16/4/8.
//  Copyright © 2016年 dengyuchao. All rights reserved.
//

import UIKit

struct SelectorDataModel {
    
    var textArray: [String]
    var isMultipleSelection: Bool = false
    
    //  optional model
    var title: String?
    var imageUrls: [String?] = []
    var isSelectedArray: [Bool] = []
    
    init(textArray: [String], isMultipleSelection: Bool, title: String?, imageUrls: [String?]?, isSelectedArray: [Bool]?) {
        self.textArray = textArray
        self.isMultipleSelection = isMultipleSelection
        self.title = title
        
        if let imgs = imageUrls {
            self.imageUrls = imgs
        } else {
            for _ in textArray {
                self.imageUrls.append(nil)
            }
        }
        
        if let isSelArray = isSelectedArray {
            self.isSelectedArray = isSelArray
        } else {
            for _ in textArray {
                self.isSelectedArray.append(false)
            }
        }
    }
}
