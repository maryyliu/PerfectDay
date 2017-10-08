//
//  File.swift
//  PerfectDay
//
//  Created by Mary Y. Liu  on 10/7/17.
//  Copyright © 2017 Mary Y. Liu . All rights reserved.
//


import Foundation
import UIKit

class MasterViewController: UITableViewController {
    var samples: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return samples.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let cellIdentifier = "Cell"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
            if (cell == nil) {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
                cell!.accessoryType = .disclosureIndicator
            }
            
            let sample = samples.object(at: indexPath.item) as! NSDictionary
            cell!.textLabel!.text = sample.value(forKey: "title") as? String
            cell!.detailTextLabel!.text = sample.value(forKey: "description") as? String
            
            return cell!;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sample = samples.object(at: indexPath.item) as! NSDictionary
        let controllerClass = sample.value(forKey: "controller") as! UIViewController.Type
        let viewController = controllerClass.init()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
