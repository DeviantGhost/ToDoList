//
//  ViewController.swift
//  Pratice
//
//  Created by Carlon Rosales on 7/29/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rectOne = CGRect(x: 10, y: 30, width: self.view.bounds.width - 20, height: 50)
        
        let textName = UITextField.init(frame: rectOne)
        view.addSubview(textName)
        textName.backgroundColor = .gray
        textName.placeholder = "Fist text box"
        
    }

}

