//
//  Connection.swift
//  Yo Intervengo
//
//  Created by Jorge Raul Ovalle Zuleta on 2/5/15.
//  Copyright (c) 2015 Olinguito. All rights reserved.
//

import UIKit
import Foundation



class Connection: NSObject {
    let db = SQLiteDB.sharedInstance()
    override init() {
        super.init()
    }
    
    // GET MONUMENTS
    func getMonuments() -> NSMutableArray{
        var returnArray = NSMutableArray()
        let data = db.query("SELECT * FROM monuments")
        for key in data{
            var monument: Dictionary<String, String> = [:]
            if let _id = key["id"] {
                monument["ID"] = _id.asString()
            }
            if let name = key["name"] {
                monument["NAME"] = name.asString()
            }
            if let name = key["subtitle"] {
                monument["DESCRIPTION"] = name.asString()
            }
            if let name = key["pray1"] {
                monument["PRAY1"] = name.asString()
            }
            if let name = key["pray2"] {
                monument["PRAY2"] = name.asString()
            }
            if let name = key["prad"] {
                monument["PRAY3"] = name.asString()
            }
            if let name = key["text3"] {
                monument["TEXT3"] = name.asString()
            }
            returnArray.addObject(monument)
        }
        return returnArray
    }
    
    // GET VIACRUSIS
    func getViaCrusis() -> NSMutableArray{
        var returnArray = NSMutableArray()
        let data = db.query("SELECT * FROM viacrusis")
        for key in data{
            var monument: Dictionary<String, String> = [:]
            if let _id = key["id_day"] {
                monument["ID"] = _id.asString()
            }
            if let name = key["alias"] {
                monument["ALIAS"] = name.asString()
            }
            if let name = key["name"] {
                monument["NAME"] = name.asString()
            }
            if let name = key["text_day"] {
                monument["TEXT1"] = name.asString()
            }
            if let name = key["prays"] {
                monument["PRAY1"] = name.asString()
            }
            if let name = key["text2_day"] {
                monument["TEXT2"] = name.asString()
            }
            if let name = key["tit"] {
                monument["TIT"] = name.asString()
            }
            returnArray.addObject(monument)
        }
        return returnArray
    }
    
}


