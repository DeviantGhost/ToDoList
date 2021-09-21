//
//  ViewController.swift
//  ProgramaicTableview
//
//  Created by Carlon Rosales on 8/9/21.
//

import UIKit

class ViewController: UIViewController {

    
    var firstName: UITextField?
    var lastNmae: UITextField?
    var addPersonbtn: UIButton?
    var tblView: UITableView?
    var arrData = [person]()
   
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .gray
        createFrame()
        createTblView()
        
    }
    
    func createFrame() {
        //////////////////////////////////FName Frame/////////////////////////////////////////////////
        firstName = getTxt(Placeholder: "Please Enter your firstName")
        firstName?.translatesAutoresizingMaskIntoConstraints = false
        
        var leadingConstraint = NSLayoutConstraint.init(item: firstName! as Any, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 20)
        view.addConstraint(leadingConstraint)
        
        var trailingConstraint = NSLayoutConstraint.init(item: firstName!, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -20)
        view.addConstraint(trailingConstraint)
        
        var topConstraint = NSLayoutConstraint.init(item: firstName!, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 60)
        view.addConstraint(topConstraint)
        
        var heightConstraint = NSLayoutConstraint.init(item: firstName!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
        view.addConstraint(heightConstraint)
        //////////////////////////////////LName Frame/////////////////////////////////////////////////
        lastNmae = getTxt(Placeholder: "Please Enter Your LastName")
        lastNmae?.translatesAutoresizingMaskIntoConstraints = false
        
        leadingConstraint = NSLayoutConstraint.init(item: lastNmae!, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 20)
        view.addConstraint(leadingConstraint)
        
        trailingConstraint = NSLayoutConstraint.init(item: lastNmae!, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -20)
        view.addConstraint(trailingConstraint)
        
        topConstraint = NSLayoutConstraint.init(item: lastNmae!, attribute: .top, relatedBy: .equal, toItem: firstName, attribute: .bottom, multiplier: 1.0, constant: 20)
        view.addConstraint(topConstraint)
        
        heightConstraint = NSLayoutConstraint.init(item: lastNmae!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
        view.addConstraint(heightConstraint)
        //////////////////////////////////Creating Button and its Frame/////////////////////////////////////////////////
        
        addPersonbtn = UIButton.init()
        view.addSubview(addPersonbtn!)
        addPersonbtn?.setTitle("Add FullName", for: .normal)
        addPersonbtn?.backgroundColor = .orange
        addPersonbtn?.layer.borderColor = UIColor.white.cgColor
        addPersonbtn?.layer.borderWidth = 5
        addPersonbtn?.layer.masksToBounds = true
        addPersonbtn?.layer.cornerRadius = 30
        addPersonbtn?.clipsToBounds = true
        addPersonbtn?.translatesAutoresizingMaskIntoConstraints =  false
        addPersonbtn?.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        
       
        
        topConstraint = NSLayoutConstraint.init(item: addPersonbtn!, attribute: .top, relatedBy: .equal, toItem: lastNmae, attribute: .bottom, multiplier: 1.0, constant: 20)
        view.addConstraint(topConstraint)
        
        heightConstraint = NSLayoutConstraint.init(item: addPersonbtn!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
        view.addConstraint(heightConstraint)
        
        var widthConstraint = NSLayoutConstraint.init(item: addPersonbtn!, attribute: .width, relatedBy: .equal, toItem: lastNmae, attribute: .width, multiplier: 0.40, constant: 0)
        view.addConstraint(widthConstraint)
        
        let centerConstraint = NSLayoutConstraint.init(item: addPersonbtn!, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 100)
        view.addConstraint(centerConstraint)
        
        //***********custom drop down view********************//
        let DropdownView = DropdownView.init(frame: CGRect.zero)
        view.addSubview(DropdownView)
        DropdownView.backgroundColor = .orange
        DropdownView.layer.borderColor = UIColor.white.cgColor
        DropdownView.layer.borderWidth = 5
        DropdownView.translatesAutoresizingMaskIntoConstraints = false
        DropdownView.layer.masksToBounds = true
        DropdownView.layer.cornerRadius = 30
        
        
        topConstraint = NSLayoutConstraint.init(item: DropdownView, attribute: .top, relatedBy: .equal, toItem: lastNmae, attribute: .bottom, multiplier: 1.0, constant: 20)
        view.addConstraint(topConstraint)
        
        heightConstraint = NSLayoutConstraint.init(item: DropdownView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
        view.addConstraint(heightConstraint)
        
        widthConstraint = NSLayoutConstraint.init(item: DropdownView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 150)
        view.addConstraint(widthConstraint)

        leadingConstraint = NSLayoutConstraint.init(item: DropdownView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 20)
        view.addConstraint(leadingConstraint)
    }
   
    
    
    @objc func btnClick(){
       
        let txtFname = firstName?.text
        let txtLname = lastNmae?.text
        
        let p = person(fName: txtFname!, lName: txtLname!)
      
        if (firstName?.text == "") || (lastNmae?.text == "") {
            let alert = UIAlertController(title: "Invalid Entry", message: "Please fill the textFields.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            firstName?.text = ""
            lastNmae?.text = ""
            print("Empty text")

        }else if (firstName?.text?.count ?? 0 >= 10 ) || (lastNmae?.text?.count ?? 0 >= 10 ){
            let alert = UIAlertController(title: "Please Check Characters", message: "This is an alert.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
            firstName?.text = ""
            lastNmae?.text = ""

            
        }else{
            
            arrData.append(p)
            firstName?.text = ""
            lastNmae?.text = ""
            tblView?.reloadData()
        }
      
    }
    
    
    func createTblView() {
        tblView = UITableView.init()
        tblView?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tblView!)
        tblView?.tableFooterView = UIView()
        tblView?.delegate = self
        tblView?.dataSource = self
        tblView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        let leadingConstraint = NSLayoutConstraint.init(item: tblView! as Any, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 20)
        view.addConstraint(leadingConstraint)
        
        let trailingConstraint = NSLayoutConstraint.init(item: tblView!, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -20)
        view.addConstraint(trailingConstraint)
        
        let topConstraint = NSLayoutConstraint.init(item: tblView!, attribute: .top, relatedBy: .equal, toItem: addPersonbtn, attribute: .bottom, multiplier: 1.0, constant: 20)
        view.addConstraint(topConstraint)
        
        let bottomConstraint = NSLayoutConstraint.init(item: tblView!, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: -20)
        view.addConstraint(bottomConstraint)
    }

    func getTxt(Placeholder: String) -> UITextField {
        let txt = UITextField.init()
        txt.backgroundColor = .white
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.placeholder = Placeholder
        txt.layer.borderColor = UIColor.orange.cgColor
        txt.borderStyle = .roundedRect
        txt.layer.borderWidth = 5
        txt.layer.cornerRadius = 30
        txt.clipsToBounds = true
        view.addSubview(txt)
        
        return txt
    }

}
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let rows = arrData[indexPath.row]
        let row = rows.getFullname()
        cell?.textLabel?.text = row
        
        
        return cell ??  UITableViewCell()
    }
    
   
    
}

struct person {
    let fName:String
    let lName:String
    
    func getFullname() ->String  {
        return fName + " " + lName
    }
    
    
}



