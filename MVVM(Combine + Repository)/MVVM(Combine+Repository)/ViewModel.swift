//
//  ViewModel.swift
//  MVVM(Combine+Repository)
//
//  Created by 도영훈 on 2021/07/30.
//

import Foundation
import Combine

class ViewModel{
    private var cancelBag = Set<AnyCancellable>()
    var datas = CurrentValueSubject<[DataModel],Never>([])
    private var repository : Repository
    var sendData : Bool!
    
    init(){
        repository = Repository()
        sendData = false
        setCombine()
    }
    
    func setCombine(){
        repository.datas.sink(receiveValue: {[unowned self] data in
            print("send Second : \(data)")
            sendData = true
            datas.send(data)
        }).store(in: &cancelBag)
    }
    
    func getData() {
        repository.getData()
    }
    
    func changeData(name : String,age : Int,address : String){
        repository.changeData(name: name, age: age, address: address)
    }
}
