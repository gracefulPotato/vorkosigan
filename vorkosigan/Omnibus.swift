//
//  Omnibus.swift
//  vorkosigan
//
//  Created by Grace O'Hair-Sherman on 12/16/15.
//  Copyright (c) 2015 Grace O'Hair-Sherman. All rights reserved.
//

import UIKit

class Omnibus: NSObject {
    var title: String = ""
    var works = [String]()
    var omnibus: Omnibus! {
        didSet {
            var imgName: String = "\(self.title)"
            var coverImg = UIImage(named: imgName)
        }
    }
    var isRead: Bool!
    var internalChronNum : Int
    var imgName : String
    internal required init(title: String, num: Int){
        self.title = title
        self.internalChronNum = num
        imgName = "\(self.title).jpg"
        //var coverPic = UIImage(named: imgName)
    }
}
