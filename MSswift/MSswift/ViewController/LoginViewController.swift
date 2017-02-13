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
    // このVCのViewModel
    let loginViewModel = LoginViewModel()
    // RX関連
    // このクラスが破棄された時に購読情報等も破棄するために必要
    let disposeBag = DisposeBag()
    
    // IBOutlets
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    // MARK: - life cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - for initialize
    
    func bind() {
        
        // IDTextFieldの入力値を監視している
        // 更新されたタイミング(onNext)でviewModelのidTextに値を代入している
        // これにより、TextFieldの入力値を更新するとviewModelのidTextも変更される
        idTextField.rx.text
            .subscribe(onNext: { [weak self] text in // <-FIXME:この構文がわからない
                if let unwrappedText = text {
                    self?.loginViewModel.idText.value = unwrappedText
                }
            }).addDisposableTo(disposeBag)
        // viewModelのidTextをIDTextFieldの入力値にバインドしている
        // これにより、viewModelのidTextを更新するとTextFieldの入力値も更新される
        loginViewModel.idText
            .asObservable()
            .bindTo(idTextField.rx.text)
            .addDisposableTo(disposeBag)
        
        // IDと同じ
        passwordTextField.rx.text
            .subscribe(onNext: { [weak self] text in
                if let unwrappedText = text {
                    self?.loginViewModel.passwordText.value = unwrappedText
                }
            }).addDisposableTo(disposeBag)
        loginViewModel.passwordText
            .asObservable()
            .bindTo(passwordTextField.rx.text)
            .addDisposableTo(disposeBag)
        
        // LoginButtonのTapを監視している
        // タップされたタイミング(onNext)でviewModelのlogin()メソッドを呼んでいる
        loginButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.loginViewModel.login()
            }).addDisposableTo(disposeBag)
        
    }

}
