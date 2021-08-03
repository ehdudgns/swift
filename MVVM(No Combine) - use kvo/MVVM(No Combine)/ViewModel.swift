//
//  ViewModel.swift
//  MVVM(No Combine)
//
//  Created by 도영훈 on 2021/07/30.
//

import Foundation

// NSObject를 상속하는 이유는 data binding을 kvo방식으로 하려고 상속해줌
class Person:NSObject{
    @objc dynamic var personData : [PersonData] = []
}

class ViewModel{
    var personDatas = Person()
    //컴퓨티드 프로퍼티
    var personDataCount : Int {
        return personDatas.personData.count
    }
    
    private var names = ["홍길동","위례","아몰랑","황선우"]
    private var ages = [24,25,26,25]
    private var addresss = ["서울","대전","대구","성남"]
    
    
    func setData(){
        for i in 0..<4{
            personDatas.personData.append(PersonData(name: names[i], age: ages[i], address: addresss[i]))
        }
    }
    
    func getData(name : String, age : Int, address : String) {
        personDatas.personData[3] = PersonData(name: name, age: age, address: address)
    }
}
