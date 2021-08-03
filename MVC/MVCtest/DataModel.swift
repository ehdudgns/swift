//
//  DataModel.swift
//  MVCtest
//
//  Created by 도영훈 on 2021/07/30.
//

import Foundation

struct DataModel{
    var name : String
    var age : Int
    var address : String
    
    func tmpData(type : data){
        switch type {
        case .a:
            print("aaaaaa")
        case .b:
            print("bbbbbb")
        case .c:
            print("cccccc")
        case .d:
            print("dddddd")
        }
    }
}


enum data :String{
    case a
    case b
    case c
    case d
}
