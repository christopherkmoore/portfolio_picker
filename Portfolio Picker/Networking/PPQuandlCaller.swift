//
//  PPQuandlCaller.swift
//  Portfolio Picker
//
//  Created by Christopher Moore on 1/14/18.
//  Copyright © 2018 Christopher Moore. All rights reserved.
//

import Foundation

class PPQuandlCaller {
    
    // wait to create until needed
    lazy var session = {
        return URLSession.shared
    }()
    
    func search(ticker: String, completion: @escaping (Bool, Any?, Error?) -> Void) {
        // build URL
        let url = URLKeys.urlBase + URLKeys.datatables + datatables.wiki.rawValue
        
        let parameters : [String: Any] = [
            URLKeys.ticker: ticker
        ]
        
        guard let urlComplete = URL(string: url + package(parameters)) else {
            print("error building url. returning in search()")
            return
        }
        let request = URLRequest(url: urlComplete)
        
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completion(false, nil, error)
                return
            }
            var result: Any?
            do {
                result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            } catch let error {
                completion(false, nil, error)
            }
            
            completion(true, result, nil)
        }.resume()
    }
    
    func package(_ parameters: [String: Any]) -> String {
        var result = ""
        
        for (key, value) in parameters {
            if !(key.isEmpty) {
                let stringValue = "\(value)"
                result += key + "=" + stringValue + "&"
            }
        }
        /* finally, add API key */
        result += URLKeys.apiKey + "=" + URLValues.apiKey
        return result
    }
    
}
