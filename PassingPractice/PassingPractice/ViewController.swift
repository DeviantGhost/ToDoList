//
//  ViewController.swift
//  PassingPractice
//
//  Created by Carlon Rosales on 8/17/21.
//

import UIKit

class ViewController: UIViewController{
    
    var idkInitialData = 5
    var initialChangeData = 10
    var text: String?
    
    @IBOutlet weak var LabelOne: UILabel!
    @IBOutlet weak var LabelTwo: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(idkData(notification:)), name: Notification.Name("idkData"), object: nil)
        LabelTwo.text = text


    }
    
    @objc func idkData(notification: Notification){
        idkInitialData = notification.userInfo?["idkData"] as! Int
        LabelOne.text = ("\(idkInitialData)")

        print("IdkInitialData: \(idkInitialData)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? SecondViewController {
            
            controller.delegate = self
            controller.completionHandler = { text in
                print("text = \(text)")
                return text
            }
        }
    }
}

extension ViewController: ChangeDelegate{
    
    func change(type: Int) {
        LabelTwo.text = ("\(type)")
        print("InitialChangeData: \(initialChangeData)")
    }
    
}

