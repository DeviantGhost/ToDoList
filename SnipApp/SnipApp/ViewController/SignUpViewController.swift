//
//  SignUp.swift
//  SnipApp
//
//  Created by Carlon Rosales on 8/11/21.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    var firstName: UITextField?
    var lastName: UITextField?
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
        loginButton?.addTarget(self, action: #selector(loginClicked), for: .touchUpInside)

        //Facebook Button Attributes
        facebookButton = getButtonAttributes(Label: "Facebook")
        facebookButton?.addTarget(self, action: #selector(facebookClicked), for: .touchUpInside)
        
        //Info Attributes
        firstName = getTxtField(placeHolder: "First Name")
        lastName = getTxtField(placeHolder: "Last Name")
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
        
        //First Name Constraints
        var constraintLeading = NSLayoutConstraint.init(item: firstName!, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 20)
        view.addConstraint(constraintLeading)
        
        var constraintTrailing = NSLayoutConstraint.init(item: firstName!, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -20)
        view.addConstraint(constraintTrailing)
        
        var constraintTop = NSLayoutConstraint.init(item: firstName!, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: screenTopPadding)
        view.addConstraint(constraintTop)
        
        var constraintHeight = NSLayoutConstraint.init(item: firstName!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: infoHeight)
        view.addConstraint(constraintHeight)
        
        //Last Name Constraints
        constraintLeading = NSLayoutConstraint.init(item: lastName!, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 20)
        view.addConstraint(constraintLeading)
        
        constraintTrailing = NSLayoutConstraint.init(item: lastName!, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -20)
        view.addConstraint(constraintTrailing)
        
        constraintTop = NSLayoutConstraint.init(item: lastName!, attribute: .top, relatedBy: .equal, toItem: firstName, attribute: .top, multiplier: 1.0, constant: infoSpacing)
        view.addConstraint(constraintTop)
        
        constraintHeight = NSLayoutConstraint.init(item: lastName!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: infoHeight)
        view.addConstraint(constraintHeight)
        
        //Email Constraints
        constraintLeading = NSLayoutConstraint.init(item: email!, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 20)
        view.addConstraint(constraintLeading)
        
        constraintTrailing = NSLayoutConstraint.init(item: email!, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -20)
        view.addConstraint(constraintTrailing)
        
        constraintTop = NSLayoutConstraint.init(item: email!, attribute: .top, relatedBy: .equal, toItem: lastName, attribute: .top, multiplier: 1.0, constant: infoSpacing)
        view.addConstraint(constraintTop)
        
        constraintHeight = NSLayoutConstraint.init(item: email!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: infoHeight)
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
    
    
    
    @objc func loginClicked(){
        
        if firstName?.text?.count == 0 ||  lastName?.text?.count == 0 {
            //show error alert
            return
        }
        let userName = UserName(first: firstName?.text ?? "", last: lastName?.text ?? "")
        let userLogin = UserLogin(email: self.email?.text ?? "", password: self.password?.text ?? "")
        
        let newUser = UserSignUp(userNameInfo: userName, userLoginInfo: userLogin)
        arrDataSource.append(newUser)
    }
    
    @objc func facebookClicked(){
        
        
    }
    

}

struct UserSignUp {
    var userName: UserName?
    var userLogin: UserLogin?
    
    init(userNameInfo: UserName, userLoginInfo: UserLogin){
        
        userName = userNameInfo
        userLogin = userLoginInfo
    }
    
}

struct UserName {
    var firstNameInfo: String?
    var lastNameInfo: String?
    
    init(first: String, last: String){
        
        firstNameInfo = first
        lastNameInfo = last
    }
    
}

struct UserLogin{
    var emailInfo: String?
    var passwordInfo: String?
    
    init(email: String, password: String){
        
        emailInfo = email
        passwordInfo = password
    }
}
