//
//  ViewController.swift
//  MVVM(No Combine)
//
//  Created by 도영훈 on 2021/07/30.
//

import UIKit

class ViewController: UIViewController {

    private var viewModel = ViewModel()
    private var observation : NSKeyValueObservation!
    @IBOutlet weak var dataList: UITableView!
    
    @IBOutlet weak var refreshButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        dataList.delegate = self
        dataList.dataSource = self
        setViewModel()
    }
    
    private func setViewModel() {
        viewModel.setData()
        observation = self.viewModel.personDatas.observe(\.personData, options: .new) { _,_ in
            self.dataList.reloadData()
        }
    }

    @IBAction func updateButton(_ sender: Any) {
        viewModel.getData(name: "지원", age: 26, address: "위례")
    }
    
}

extension ViewController:UITableViewDelegate{
}

extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.personDataCount// depth가 깊으면 좋지 않음
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell") as! DataCell
        cell.configure(personData: viewModel.personDatas.personData[indexPath.row])
        return cell
    }
}

class DataCell : UITableViewCell{
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var address: UILabel!
    
    func configure(personData : PersonData){
        name.text = personData.name
        age.text = String(personData.age)
        address.text = personData.address
        
    }
}

