//
//  ViewController.swift
//  APIHPratice
//
//  Created by Carlon Rosales on 8/27/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var text: UILabel!
    
    var mvc = DataViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mvc.provideData() {
            
        }
    }


}

