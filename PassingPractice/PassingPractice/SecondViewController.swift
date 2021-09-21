//
//  SecondViewController.swift
//  PassingPractice
//
//  Created by Carlon Rosales on 8/17/21.
//

import Foundation
import UIKit


class SecondViewController: UIViewController {
    
    var delegate: ChangeDelegate?
    
    @IBOutlet weak var SecLabel: UILabel!
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var SecButton: UIButton!
    
    var completionHandler: ((String) -> String)?
    
    var idkDataNum = 0

    
    override func viewDidLoad() {
        idkDataNum = 1
        super.viewDidLoad()
        NotificationCenter.default.post(name: Notification.Name("idkData"), object: nil, userInfo: ["idkData": idkDataNum])
 
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        delegate?.change(type: 15)

    }
    
    @IBAction func secButtonClicked(_ sender: Any) {
        
        let result = completionHandler?("Yogscast")
        print("Yea E yeaa \(String(describing: result ?? ""))")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ViewController {
            
            controller.text = "5"
        }
    }
    
    
}

protocol ChangeDelegate {
    func change(type: Int)
}
