//
//  AddVC.swift
//  EasyTodo
//
//  Created by Thanapat Sorralump on 16/2/2561 BE.
//  Copyright © 2561 Thanapat Sorralump. All rights reserved.
//

import UIKit

protocol ListDelegate {
  func sendData(list: String)
}

class AddListVC: UIViewController {
  
  var delegate: ListDelegate?
  
  @IBOutlet weak var listField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func addList(_ sender: UIButton) {
    guard let list = listField.text else { return }
    delegate?.sendData(list: list)
    
    performSegue(withIdentifier: "unwindToMain", sender: self)
  }
}






