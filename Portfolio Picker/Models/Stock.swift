//
//  Stock.swift
//  Portfolio Picker
//
//  Created by Christopher Moore on 1/14/18.
//  Copyright © 2018 Christopher Moore. All rights reserved.
//

import Foundation

struct Stock {
    
    var name: String
    var data: [StockData]
    
    init(json: AnyObject) {
        let datatable = json.value(forKey: "datatable") as? AnyObject
        let data = datatable?.value(forKey: "data") as? [[AnyObject]]
        let columns = datatable?.value(forKey: "columns") as? [[String: String]]
        self.name = data?.first?.first as? String ?? ""
        
        var tempData = [StockData]()
        
        data?.forEach { piece in
            let stock = StockData(json: piece)
            tempData.append(stock)
        }
        
        self.data = tempData
    }
        
}

struct StockData {
    
    var ticker: String?
    var date: String?
    var open: Float?
    var high: Float?
    var low: Float?
    var close: Float?
    var volume: Float?
    var exDividend: Float?
    var splitRatio: Double?
    var adjustedOpen: Float?
    var adjustedHight: Float?
    var adjustedLow: Float?
    var adjustedClose: Float?
    var adjustedVolume: Double?
    
    init(json: [AnyObject]) {
        self.ticker = json[0] as? String ?? ""
        self.date = json[1] as? String ?? ""
        self.open = json[2] as? Float ?? nil
        self.high = json[3] as? Float ?? nil
        self.low = json[4] as? Float ?? nil
        self.close = json[5] as? Float ?? nil
        self.volume = json[6] as? Float ?? nil
        self.exDividend = json[7] as? Float ?? nil
        self.splitRatio = json[8] as? Double ?? nil
        self.adjustedOpen = json[9] as? Float ?? nil
        self.adjustedHight = json[10] as? Float ?? nil
        self.adjustedLow = json[11] as? Float ?? nil
        self.adjustedClose = json[12] as? Float ?? nil
        self.adjustedVolume = json[13] as? Double ?? nil
    }
}
