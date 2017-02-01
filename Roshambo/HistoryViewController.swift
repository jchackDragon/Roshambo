//
//  HistoryViewController.swift
//  Roshambo
//
//  Created by Juan Carlos Lopez on 10/31/16.
//  Copyright © 2016 Juan Carlos Lopez. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController: UITableViewController{

    var history:[Match]!
    
    let identifier = "historyCell"
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier)!
        let msg = history[indexPath.row]
        
        
        cell.textLabel?.text = msg.description
        
        return cell
    }
}
