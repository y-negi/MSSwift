//
//  LoginViewController.swift
//  MSswift
//
//  Created by 根岸裕太 on 2017/02/04.
//  Copyright © 2017年 根岸裕太. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    let loginViewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        loginViewModel.idText
//            .asObservable()
//            .map{ $0 }
//            .bindTo(idTextField.rx.text)
//            .addDisposableTo(disposeBag)
        loginViewModel.idText
            .asObservable()
            .map{ $0 }
            .bindTo(label.rx.text)
            .addDisposableTo(disposeBag)
        
        loginViewModel.passwordText
            .asObservable()
            .map{ $0 }
            .bindTo(passwordTextField.rx.text)
            .addDisposableTo(disposeBag)
        
        loginButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.loginViewModel.login()
            }).addDisposableTo(disposeBag)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
