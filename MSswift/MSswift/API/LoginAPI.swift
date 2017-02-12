//
//  LoginAPI.swift
//  APIPractice
//
//  Created by 根岸裕太 on 2017/01/19.
//  Copyright © 2017年 根岸裕太. All rights reserved.
//

class LoginAPI: APIParameterProtocol {
    // リクエストパラメータ
    private var requestId: String?
    private var requestPassword: String?
    
    // レスポンスパラメータ
    var responseIsLogin: Bool = false
    
    // 各API共通のパラメータ
    // プロトコルで定義している
    let url: String = "https://LoginAPI"
    var errorType: Int = 0
    var errorMessage: String = ""
    var requestParameter: Dictionary<String, Any> = Dictionary<String, Any>()
    
    /// リクエストパラメータをセット
    ///
    /// - Parameters:
    ///   - id: ID
    ///   - pass: PASSWORD
    func setRequestParameter(id: String, pass: String) {
        requestId = id
        requestPassword = pass
        requestParameter = ["id": requestId ?? "", "pass": requestPassword ?? ""]
    }
    
    /// レスポンスパラメータをセット
    ///
    /// - Parameter responseObject: APIのレスポンスで返ってきたもの
    func setResponseParameter(responseObject: Dictionary<String, Any>) {
        responseIsLogin = responseObject["isLogin"] as! Bool? ?? false
    }
}
