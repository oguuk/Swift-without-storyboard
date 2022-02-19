//
//  RootViewController.swift
//  Newstock
//
//  Created by 오국원 on 2022/02/17.
//

import UIKit

class RootViewController:UIViewController {
    
    //Mark: Properties
    lazy var tdsLabel:UILabel = {
        let label = UILabel()
        label.text = "Today's Stock"
        label.font = UIFont.italicSystemFont(ofSize: 40)
        return label
    }()
    
    lazy var loginLabel:UILabel = {
        let label = UILabel()
        label.text = "pro"
        return label
    }()
    
    lazy var loginTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "ID"
        return tf
    }()
    
    lazy var pswTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var loginButton:UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("LOGIN", for: UIControl.State.normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(loginButtonTapped), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    lazy var loginTextFieldView:UIView = {
       let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.tertiarySystemGroupedBackground.cgColor
        view.layer.borderWidth = 1
        view.addSubview(loginTextField)
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        loginTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        loginTextField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 10).isActive = true
        loginTextField.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -10 ).isActive = true
        return view
    }()
    
    lazy var pswTextFieldView:UIView = {
       let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.tertiarySystemGroupedBackground.cgColor
        view.layer.borderWidth = 1
        view.addSubview(self.pswTextField)
        self.pswTextField.translatesAutoresizingMaskIntoConstraints = false
        self.pswTextField.topAnchor.constraint(equalTo: view.topAnchor, constant:  0).isActive = true
        self.pswTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        self.pswTextField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 10).isActive = true
        self.pswTextField.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -10 ).isActive = true
        return view
    }()
    
    //Mark: Configures
    func configureViewComponent(){
        self.view.backgroundColor = .systemBackground
        
        view.addSubview(tdsLabel)
        tdsLabel.translatesAutoresizingMaskIntoConstraints = false
        tdsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90).isActive = true
        tdsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(loginLabel)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.topAnchor.constraint(equalTo: tdsLabel.bottomAnchor, constant: 20).isActive = true
        loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(loginTextFieldView)
        loginTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        loginTextFieldView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 50).isActive = true
        loginTextFieldView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginTextFieldView.widthAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
        loginTextFieldView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(pswTextFieldView)
        pswTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        pswTextFieldView.topAnchor.constraint(equalTo: loginTextFieldView.bottomAnchor, constant: 20).isActive = true
        pswTextFieldView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pswTextFieldView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        pswTextFieldView.widthAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
        
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: pswTextFieldView.bottomAnchor, constant: 40).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
        
        configureColors()
        
    }
    
    //Mark: Life Cycle functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponent()
        hideKeyboardWhenTappedAround()
    }
    //Mark: Override
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        //디바이스의 테마가 변경될때마다 발동되어짐.
        configureColors()
    }
    
    //Mark: Selectors
    @objc func loginButtonTapped(){
        navigationController?.pushViewController(ScrollViewController(), animated: true)
    }
    //Mark: Helpers

    //Mark: Configures
    
    func configureColors(){
        if self.traitCollection.userInterfaceStyle == .dark {
            loginButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
            loginButton.backgroundColor = .white
        }else{
            loginButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
            loginButton.backgroundColor = .black
        }
    }
    
    
}
