//
//  ViewController.swift
//  Portfolio Picker
//
//  Created by Christopher Moore on 1/14/18.
//  Copyright © 2018 Christopher Moore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    let quandl = PPQuandlCaller()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func searchStock(_ sender: Any) {
        guard let text = searchTextField.text else {
            return
        }
        quandl.search(ticker: text) { (success, data, error) in
            if let data = data {
                let stock = Stock(json: data)
                print(data)
            }
            
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

