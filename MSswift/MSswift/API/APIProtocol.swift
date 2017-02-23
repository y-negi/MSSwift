
//
//  APIProtocol.swift
//  APIPractice
//
//  Created by 根岸裕太 on 2017/01/18.
//  Copyright © 2017年 根岸裕太. All rights reserved.
//

import AFNetworking

enum APIError: Error {
    case NoError
    case Parameter
    case Network
    case Timeout
    case Unknown
}

protocol APIParameterProtocol: class {
    var url: String { get }
    var errorType: Error { set get }
    var errorMessage: String { set get }
    var requestParameter: Dictionary<String, Any> { get }
    func setResponseParameter(responseObject: Dictionary<String, Any>)
}

extension APIParameterProtocol {
    
    /// POST通信
    ///
    /// - Parameter closure: レスポンスを呼び出し側に返すためのクロージャ
    func postRequest(closure: @escaping (_ responseObject: Self) -> ()) {
        
        let manager:AFHTTPRequestOperationManager = AFHTTPRequestOperationManager()
        let serializer:AFJSONRequestSerializer = AFJSONRequestSerializer()
        
        manager.requestSerializer = serializer
        
        manager.post(url,
                     parameters: requestParameter,
                     success: { (operation: AFHTTPRequestOperation, responsobject: Any) in
                        let responseDic: Dictionary<String, Any> = responsobject as! Dictionary<String, Any>
                        self.setResponseParameter(responseObject: responseDic)
                        closure(self)
        },
                     failure: { (operation: AFHTTPRequestOperation?, error: Error) in
                        self.errorType = APIError.Parameter
                        self.errorMessage = "えらー"
                        closure(self)
        })

        
    }
}
