//
//  ViewController.swift
//  SnipApp
//
//  Created by Carlon Rosales on 8/11/21.
//

import UIKit

class LoginScreen: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    var signUpButton: UIButton?
    var loginButton: UIButton?
    
    var loginButtonsHeight = 50.0
    var loginButtonsWidth = 280.0
    var buttonAdded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setUpNodes()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addButtons(tapGestureRecognizer:)))
        backgroundImage.isUserInteractionEnabled = true
        backgroundImage.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    func setUpNodes(){
        //Background Image Attributes
        backgroundImage.image = UIImage(named: "SnipLogo")
        backgroundImage.center = (backgroundImage.superview?.center)!
        

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
        txt.textInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        txt.layer.borderColor = CGColor(gray: 0, alpha: 0.4)
        txt.layer.borderWidth = 2
        txt.layer.cornerRadius = loginButtonsHeight/2
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.placeholder = placeHolder
        
        view.addSubview(txt)
        return txt

    }
    
    func setUpConstraints(){
        //Sign Up Constraints
        var constraintHeight = NSLayoutConstraint.init(item: signUpButton!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: loginButtonsHeight)
        view.addConstraint(constraintHeight)
        
        var constraintWidth = NSLayoutConstraint.init(item: signUpButton!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: loginButtonsWidth)
        view.addConstraint(constraintWidth)
        
        var centerX = NSLayoutConstraint.init(item: signUpButton!, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0)
        view.addConstraint(centerX)
        
        var constraintTop = NSLayoutConstraint.init(item: signUpButton!, attribute: .top, relatedBy: .equal, toItem: backgroundImage!, attribute: .bottom, multiplier: 1.0, constant: 20)
        view.addConstraint(constraintTop)

        //Login Constraints
        
        constraintHeight = NSLayoutConstraint.init(item: loginButton!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: loginButtonsHeight)
        view.addConstraint(constraintHeight)
        
        constraintWidth = NSLayoutConstraint.init(item: loginButton!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: loginButtonsWidth)
        view.addConstraint(constraintWidth)
        
        centerX = NSLayoutConstraint.init(item: loginButton!, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0)
        view.addConstraint(centerX)
        
        constraintTop = NSLayoutConstraint.init(item: loginButton!, attribute: .top, relatedBy: .equal, toItem: signUpButton!, attribute: .bottom, multiplier: 1.0, constant: 20)
        view.addConstraint(constraintTop)
        
    }

    @objc func signUpClicked(){
        print("Sign up")
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let signUpViewController = storyBoard.instantiateViewController(withIdentifier: "SignUpViewController")
        navigationController?.pushViewController(signUpViewController, animated: true)
    }

    @objc func loginClicked(){
        print("Login")

    }
    @objc func addButtons(tapGestureRecognizer: UITapGestureRecognizer){
        if !buttonAdded {
            //Sign Up Button Attributes
            //signUpButton = getTxtField(placeHolder: "Sign up")
            signUpButton = getButtonAttributes(Label: "Sign up")
            signUpButton?.addTarget(self, action: #selector(signUpClicked), for: .touchUpInside)

            
            //Login Button Attributes
            //loginButton = getTxtField(placeHolder: "Login")
            loginButton = getButtonAttributes(Label: "Login")
            loginButton?.addTarget(self, action: #selector(loginClicked), for: .touchUpInside)
            
            setUpConstraints()
            buttonAdded = true
        }
    }
    
}

