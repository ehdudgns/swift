//
//  Repository.swift
//  MVVM(Combine+Repository)
//
//  Created by 도영훈 on 2021/07/30.
//

import Foundation
import Combine

class Repository{
    
    private var cancleBag = Set<AnyCancellable>()
    var datas = PassthroughSubject<[DataModel],Never>()
    var tmpDatas :[DataModel] = []
    
    func getData(){
        let names = ["홍길동","영훈","최우선","멜로망스"]
        let ages = [23,24,25,33]
        let addresss = ["대전","위례","일산","홍대"]
        
        DispatchQueue.global().asyncAfter(deadline: .now()+2, execute:  {[weak self] in
            for i in 0..<4{
                self?.tmpDatas.append(DataModel(name: names[i], age: ages[i], address: addresss[i]))
            }
            print("send First : \(self?.tmpDatas)")
            self?.datas.send(self!.tmpDatas)
        })
    }
    
    func changeData(name: String,age:Int,address : String){
        
        tmpDatas[3] = DataModel(name: name, age: age, address: address)
        datas.send(tmpDatas)
    }
    
}
