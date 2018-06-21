//
//  ViewController.swift
//  MVVMexample1
//
//  Created by eric yu on 6/21/18.
//  Copyright © 2018 eric yu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginEnabledLabel: UILabel!
    
    
    var loginViewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //return control property (optional string)
        _ = emailTextField.rx.text.map { $0 ?? ""}.bind(to: loginViewModel.emailText)
        _ = passwordTextField.rx.text.map { $0 ?? ""}.bind(to: loginViewModel.passwordText)
        
        //bind isvald to login isenable
        _ = loginViewModel.isVald.bind(to: loginButton.rx.isEnabled)
        
        loginViewModel.isVald.subscribe(onNext: { [unowned self] isValid in
            self.loginEnabledLabel.text = isValid ? "Enable" : "Not Enable"
            self.loginEnabledLabel.textColor = isValid ?  .green : .red
            print("isvalid = \(isValid)")
        }).disposed(by: disposeBag)
        //clean the memory
        
        
    }
    
    



}

