//
//  ViewController.swift
//  Programmtic_Autolayout
//
//  Created by Carlon Rosales on 06/08/21.
//

import UIKit

class ViewController: UIViewController {
    
    var tblView: UITableView?
    var addPersonButton: UIButton?
    var txtFirstName: UITextField?
    var txtSecondName: UITextField?
    var arrDataSource = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .gray
        createUI()
    }
    
    
    func createUI() {
        createFormFields()
        createTableView()
    }
    
    func createFormFields() {
        txtFirstName = getTxtField(placeHolder: "enter first name")
        var constraintLeading = NSLayoutConstraint.init(item: txtFirstName!, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 20)
        view.addConstraint(constraintLeading)
        
        var constraintTrailing = NSLayoutConstraint.init(item: txtFirstName!, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -20)
        view.addConstraint(constraintTrailing)
        
        var constraintTop = NSLayoutConstraint.init(item: txtFirstName!, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 40)
        view.addConstraint(constraintTop)
        
        var constraintHeight = NSLayoutConstraint.init(item: txtFirstName!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 60)
        view.addConstraint(constraintHeight)
                
        txtSecondName = getTxtField(placeHolder: "enter second name")
        constraintLeading = NSLayoutConstraint.init(item: txtSecondName!, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 20)
        view.addConstraint(constraintLeading)
        
        constraintTrailing = NSLayoutConstraint.init(item: txtSecondName!, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -20)
        view.addConstraint(constraintTrailing)
        
        constraintHeight = NSLayoutConstraint.init(item: txtSecondName!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 60)
        view.addConstraint(constraintHeight)
        
        
        constraintTop = NSLayoutConstraint.init(item: txtSecondName!, attribute: .top, relatedBy: .equal, toItem: txtFirstName, attribute: .bottom, multiplier: 1.0, constant: 15)
        view.addConstraint(constraintTop)
        
        //Adds personButton
        addPerson()
        
        constraintHeight = NSLayoutConstraint.init(item: addPersonButton!, attribute: .height, relatedBy: .equal, toItem: txtSecondName, attribute: .height, multiplier: 0.50, constant: 0)
        view.addConstraint(constraintHeight)
        
//        let constraintWidth = NSLayoutConstraint.init(item: addPersonButton!, attribute: .width, relatedBy: .equal, toItem: txtSecondName, attribute: .width, multiplier: 0.50, constant: 0)
//        view.addConstraint(constraintWidth)
        
        constraintTop = NSLayoutConstraint.init(item: addPersonButton!, attribute: .top, relatedBy: .equal, toItem: txtSecondName, attribute: .bottom, multiplier: 1.0, constant: 15)
        view.addConstraint(constraintTop)
        
//        let centerX = NSLayoutConstraint.init(item: addPersonButton!, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0)
//        view.addConstraint(centerX)
        
        constraintTrailing = NSLayoutConstraint.init(item: addPersonButton!, attribute: .trailing, relatedBy: .equal, toItem: txtSecondName, attribute: .trailing, multiplier: 1.0, constant: 0)
        view.addConstraint(constraintTrailing)
        
        constraintLeading = NSLayoutConstraint.init(item: addPersonButton!, attribute: .leading, relatedBy: .equal, toItem: txtSecondName, attribute: .leading, multiplier: 1.0, constant: 0)
        view.addConstraint(constraintLeading)
    }

    
    func createTableView() {
        
        tblView = UITableView.init()
        tblView?.translatesAutoresizingMaskIntoConstraints = false
        tblView?.delegate = self
        tblView?.dataSource = self
        view.addSubview(tblView!)
        tblView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
       tableViewConstraint()
    }
    
     func getTxtField(placeHolder: String) -> UITextField {
        let txt = UITextField.init()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.backgroundColor = UIColor.darkGray
        txt.placeholder = placeHolder
        
        view.addSubview(txt)
        return txt
    }
    
    @objc func submitClicked() {
        if txtSecondName?.text?.count == 0 ||  txtFirstName?.text?.count == 0 {
            //show error alert
            return
        }
        let txtFirst  = txtFirstName?.text
        let txtSecond = txtSecondName?.text
        let p = Person(fName: txtFirst!, sName: txtSecond!)
        arrDataSource.append(p)
        tblView?.reloadData()//refresh after add new person
    }
    
    func addPerson(){
        addPersonButton = UIButton.init()
        addPersonButton?.translatesAutoresizingMaskIntoConstraints = false
        addPersonButton?.addTarget(self, action: #selector(submitClicked), for: .touchUpInside)
        addPersonButton?.backgroundColor = UIColor.blue
        addPersonButton?.setTitle("Add Person", for: .normal)
        addPersonButton?.layer.cornerRadius = 10
        view.addSubview(addPersonButton!)
    }
    
    func tableViewConstraint(){
        let constraintLeading = NSLayoutConstraint.init(item: tblView!, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 20)
        view.addConstraint(constraintLeading)
        
        let constraintTrailing = NSLayoutConstraint.init(item: tblView!, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -20)
        view.addConstraint(constraintTrailing)
        
        let constraintTop = NSLayoutConstraint.init(item: tblView!, attribute: .top, relatedBy: .equal, toItem: addPersonButton!, attribute: .bottom, multiplier: 1.0, constant: 20)
        view.addConstraint(constraintTop)

        let constraintBottom = NSLayoutConstraint.init(item: tblView!, attribute: .bottom, relatedBy: .equal, toItem: view!, attribute: .bottom, multiplier: 1.0, constant: -20)
        view.addConstraint(constraintBottom)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDataSource.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let p = arrDataSource[indexPath.row]
        let fullName = p.getFullName()
        cell?.textLabel?.text = fullName
        return cell ?? UITableViewCell()
    }
    
    
}


struct Person {
    let fName: String
    let sName: String
    
    func getFullName()->String {
        return fName + " " + sName
    }
}
