//
//  LoginViewModel.swift
//  MSswift
//
//  Created by 根岸裕太 on 2017/02/04.
//  Copyright © 2017年 根岸裕太. All rights reserved.
//

import UIKit
import RxSwift

class LoginViewModel: NSObject {
    let viewState = Variable(ViewState.Blank)
    
    var idText: Variable<String> = Variable("")
    var passwordText: Variable<String> = Variable("")
    
    func login() {
        let login = LoginAPI(id: idText.value, password: passwordText.value)
        login.postRequest { (hoge: LoginAPI) in
            print("%@", hoge.responseIsLogin)
        }
    }

}
