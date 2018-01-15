//
//  PPQuandlConstants.swift
//  Portfolio Picker
//
//  Created by Christopher Moore on 1/14/18.
//  Copyright © 2018 Christopher Moore. All rights reserved.
//

import Foundation

/* https://docs.quandl.com/docs/parameters-2 */
extension PPQuandlCaller {
    
    public struct URLKeys {
        static let apiKey = "api_key"
        static let urlBase = "https://www.quandl.com/api/v3/"
        static let databaseCode = "database_code"
        static let datasetCode = "dataset_code"
        static let datatables = "datatables"
        
        static let limit = "limit"
        static let columnIndex = "column_index"
        static let ticker = "ticker"
        
        /* dates in yyyy-mm-dd */
        static let startDateKey = "start_date"
        static let endDateKey = "end_date"
    }
    
    public struct URLValues {
        static let apiKey = "uW64JwcwZyDT4vC-BGAE"

        var limit: Int?
        var columnIndex: Int?
        var startDate: String?
        var endDate: String?
        var ticker: String?
    }
    /* all enum values are optional in URL construction */
    enum order: String {
        case asc, desc
    }
    
    enum collapse: String {
        case none, daily, weekly, monthly, quarterly, annual
    }
    
    enum transform: String {
        case none, diff, rdiff, rdiff_from, cumul, normalize
    }
    
    enum format: String {
        case json, xml, csv
    }
    
    enum datatables: String {
        /* let's just deal with JSON right now */
        case wiki = "/WIKI/PRICES.json?"
    }
    

}

