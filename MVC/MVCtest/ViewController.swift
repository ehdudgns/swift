//
//  ViewController.swift
//  MVCtest
//
//  Created by 도영훈 on 2021/07/30.
//

import UIKit

class DataCell : UITableViewCell{
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var address: UILabel!
    
    func configure(data : DataModel){
        name.text = data.name
        age.text = String(data.age)
        address.text = data.address
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var tableDataList: UITableView!
    private var tableCell : DataCell!
    private var dataModels : [DataModel]!
    private var dataLength : Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableDataList.delegate = self
        tableDataList.dataSource = self
        setDataModel()
        dataLength = dataModels.count-1
    }
    
    private func setDataModel() {
        dataModels = []
        let names = ["진렬","영희","철수","지호"]
        let ages = [30,23,23,25]
        let addresss = ["서울","부산","부산","인천"]
        for i in 0..<4{
            dataModels.append(DataModel(name: names[i], age: ages[i], address: addresss[i]))
        }
    }
    
    private func updateData(name : String, age : Int, address : String) {
        dataModels[3].name = name
        dataModels[3].age = age
        dataModels[3].address = address
        dataModels[3].tmpData(type: .a)
        tableDataList.reloadData()
    }
    
    @IBAction func refreshData(_ sender: Any) {
        updateData(name: "고수", age: 41, address: "일산")
        
    }
}

extension ViewController :UITableViewDelegate{
}

extension ViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //guard let 으로 변경 할거
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as? DataCell
       else{return DataCell()}
        cell.configure(data: dataModels[dataLength - indexPath.row])
        return cell
    }
}

