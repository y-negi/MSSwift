//
//  ViewState.swift
//  MSswift
//
//  Created by 根岸裕太 on 2017/02/18.
//  Copyright © 2017年 根岸裕太. All rights reserved.
//

/**
 Viewの状態を扱うenum
 - .Working: 描画する要素があり、アプリが正常に動いている状態
 - .Blank: 描画する要素がない状態
 - .Requesting: 描画する要素を読み込んでいる状態
 - .Error(ErrorType): エラーが起きている状態
 */
enum ViewState {
    case Working
    case Blank
    case Requesting
    case Error(Error)
    
    
    /**
     APIを叩いても良い状態かを判定
     */
    func fetchEnabled() -> Bool {
        switch self {
        case .Blank, .Working:
            return true
        default:
            return false
        }
    }
}
