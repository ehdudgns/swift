//
//  Model.swift
//  MVVM(No Combine)
//
//  Created by 도영훈 on 2021/07/30.
//

import Foundation



class PersonData : NSObject{
    var name : String
    var age : Int
    var address : String
    
    init(name : String, age : Int, address:String){
        self.name = name
        self.address = address
        self.age = age
    }
}
