//
//  LoginViewController.swift
//  SnipApp
//
//  Created by Carlon Rosales on 8/11/21.
//

import UIKit

class LoginViewController: UIViewController {

    var usersDataSource: [UserLogin]?
    
    var email: UITextField?
    var password: UITextField?

    var loginButton: UIButton?
    var facebookButton: UIButton?
    var screenTopPadding = 200.0
    
    var infoHeight = 60.0
    var infoSpacing = 50.0
    
    var loginButtonsHeight = 50.0
    var loginButtonsWidth = 280.0

    override func viewDidLoad() {
        super.viewDidLoad()
    
        setUpNodes()
        setUpConstraints()
    }

    func setUpNodes(){
        
        //Login Button Attributes
        loginButton = getButtonAttributes(Label: "Login")
        loginButton?.addTarget(self, action: #selector(signUpClicked), for: .touchUpInside)

        //Facebook Button Attributes
        facebookButton = getButtonAttributes(Label: "Facebook")
        facebookButton?.addTarget(self, action: #selector(facebookClicked), for: .touchUpInside)
        
        //Info Attributes
        
        email = getTxtField(placeHolder: "Email")
        password = getTxtField(placeHolder: "Password")

    }
    
    func getButtonAttributes(Label: String) -> UIButton{
        let button = UIButton.init()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = CGColor(gray: 0, alpha: 0.4)
        button.layer.borderWidth = 2
        button.backgroundColor = .clear
        button.layer.cornerRadius = loginButtonsHeight/2
        button.setTitle(Label, for: .normal)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        view.addSubview(button)
        
        return button
    }
    
    func getTxtField(placeHolder: String) -> UITextField{
        let txt = SnipApp.PaddedTextField.init()
        txt.backgroundColor = .clear
        txt.textInsets = UIEdgeInsets(top: 0, left: 5, bottom: 5, right: 0)
        txt.layer.cornerRadius = loginButtonsHeight/2
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.placeholder = placeHolder
        view.addSubview(txt)

        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: infoHeight - 20, width: 300, height: 1.0)
        bottomLine.backgroundColor = CGColor(gray: 0, alpha: 0.4)
        txt.borderStyle = .none
        txt.layer.addSublayer(bottomLine)
        return txt

    }
    
    func setUpConstraints(){
        
        //Email Constraints
        var constraintLeading = NSLayoutConstraint.init(item: email!, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 20)
        view.addConstraint(constraintLeading)
        
        var constraintTrailing = NSLayoutConstraint.init(item: email!, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -20)
        view.addConstraint(constraintTrailing)
        
        var constraintTop = NSLayoutConstraint.init(item: email!, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: infoSpacing)
        view.addConstraint(constraintTop)
        
        var constraintHeight = NSLayoutConstraint.init(item: email!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: infoHeight)
        view.addConstraint(constraintHeight)
        
        //Password Constraints
        constraintLeading = NSLayoutConstraint.init(item: password!, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 20)
        view.addConstraint(constraintLeading)
        
        constraintTrailing = NSLayoutConstraint.init(item: password!, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -20)
        view.addConstraint(constraintTrailing)
        
        constraintTop = NSLayoutConstraint.init(item: password!, attribute: .top, relatedBy: .equal, toItem: email, attribute: .top, multiplier: 1.0, constant: infoSpacing)
        view.addConstraint(constraintTop)
        
        constraintHeight = NSLayoutConstraint.init(item: password!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: infoHeight)
        view.addConstraint(constraintHeight)
        
        //Login Constraints
        constraintHeight = NSLayoutConstraint.init(item: loginButton!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: loginButtonsHeight)
        view.addConstraint(constraintHeight)
        
        var constraintWidth = NSLayoutConstraint.init(item: loginButton!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: loginButtonsWidth)
        view.addConstraint(constraintWidth)
        
        var centerX = NSLayoutConstraint.init(item: loginButton!, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0)
        view.addConstraint(centerX)
        
        constraintTop = NSLayoutConstraint.init(item: loginButton!, attribute: .top, relatedBy: .equal, toItem: password!, attribute: .bottom, multiplier: 1.0, constant: 20)
        view.addConstraint(constraintTop)
        
        //Facebook Constraints
        constraintHeight = NSLayoutConstraint.init(item: facebookButton!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: loginButtonsHeight)
        view.addConstraint(constraintHeight)
        
        constraintWidth = NSLayoutConstraint.init(item: facebookButton!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: loginButtonsWidth)
        view.addConstraint(constraintWidth)
        
        centerX = NSLayoutConstraint.init(item: facebookButton!, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0)
        view.addConstraint(centerX)
        
        constraintTop = NSLayoutConstraint.init(item: facebookButton!, attribute: .top, relatedBy: .equal, toItem: loginButton!, attribute: .bottom, multiplier: 1.0, constant: 20)
        view.addConstraint(constraintTop)
        
    }
    
    
    
    @objc func signUpClicked(){
        
        if email?.text?.count == 0 || password?.text?.count == 0 {
            //show error alert
            return
        }else{
            
            let userLogin = UserLogin(email: email?.text ?? "", password: password?.text ?? "")
            
            usersDataSource?.append(userLogin)
        }
    }
    
    @objc func facebookClicked(){
        print("Facebook Clicked")
        
    }
    

}
