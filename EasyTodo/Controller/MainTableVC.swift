//
//  MainTableViewController.swift
//  EasyTodo
//
//  Created by Thanapat Sorralump on 16/2/2561 BE.
//  Copyright © 2561 Thanapat Sorralump. All rights reserved.
//

import UIKit

class MainTableVC: UITableViewController, ListDelegate {
  
  var lists: [String] = []
  
  @IBAction func unwindMain(segue: UIStoryboardSegue) { }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func sendData(list: String) {
    lists.append(list)
    tableView.reloadData()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destination = segue.destination as? AddListVC {
      destination.delegate = self
    }
  }
}

extension MainTableVC {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return lists.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath)
    cell.textLabel?.text = lists[indexPath.row]
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      lists.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
    }
  }
}
