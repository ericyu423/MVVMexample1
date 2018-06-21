//
//  LoginViewModel.swift
//  MVVMexample1
//
//  Created by eric yu on 6/21/18.
//  Copyright © 2018 eric yu. All rights reserved.
//

import Foundation
import RxSwift


struct LoginViewModel {
    var emailText = Variable<String>("")
    var passwordText = Variable<String>("")
    
    //basically we will know if either of these changes
    var isVald: Observable<Bool>{
        return Observable.combineLatest(emailText.asObservable(),passwordText.asObservable()){ email, password in
            email.count >= 3 && password.count >= 3
        }
    }

}
