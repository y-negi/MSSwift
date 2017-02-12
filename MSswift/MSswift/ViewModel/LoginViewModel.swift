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
    
    var idText: Variable<String> = Variable("")
    var passwordText: Variable<String> = Variable("")
    
    func login() {
        print("id:" + idText.value + "\npassword:" + passwordText.value)
    }

}
