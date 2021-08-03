//
//  ViewController.swift
//  MVVM(Combine+Repository)
//
//  Created by 도영훈 on 2021/07/30.
//

import UIKit
import Combine
import NVActivityIndicatorView

class ViewController: UIViewController,indicatable {
    
    var indicator: NVActivityIndicatorView = NVActivityIndicatorView(frame: .zero)
    private var viewModel : ViewModel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var dataList: UITableView!
    private var cancelBag = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataList.delegate = self
        dataList.dataSource = self
        viewModel = ViewModel()
        setCombine()
        viewModel.getData()
        indicator = NVActivityIndicatorView(frame: CGRect(x: view.frame.width/2-25, y: view.frame.height/2-150, width: 50, height: 50), type: .circleStrokeSpin, color: .black, padding: 0)
        view.addSubview(indicator)
        indicatorLoading(isLoaded: false)
        

    }
    
    
    private func indicatorLoading(isLoaded : Bool) {
        if isLoaded {
            hideIndicator()
        }
        else{
            showIndicator()
        }
    }
    
    private func setCombine(){
        //main으로 바꿔서 해야한다 (ui는 무조건 main thread에서 돌아야한다) 
        viewModel.datas.receive(on: DispatchQueue.main).sink(receiveValue: { _ in
            print("helll!!!!!")
            self.dataList.reloadData()
            self.indicatorLoading(isLoaded: self.viewModel.sendData)
        }).store(in: &cancelBag)
    }
    
    
    @IBAction func refreshData(_ sender: Any) {
        print("pressed!!")
        viewModel.changeData(name: "지오", age: 28, address: "서울")
    }
}


extension ViewController : UITableViewDelegate{
}

extension ViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.datas.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! TableCell
        cell.configure(data: viewModel.datas.value[indexPath.row])
        return cell
    }
}

class TableCell : UITableViewCell{
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var address: UILabel!
    
    func configure(data : DataModel){
        self.name.text = data.name
        self.age.text = String(data.age)
        self.address.text = data.address
    }
}

protocol indicatable {
    var indicator: NVActivityIndicatorView { set get }
    func showIndicator()
    func hideIndicator()
}

extension indicatable {
    func showIndicator() {
        indicator.startAnimating()
    }

    func hideIndicator() {
        indicator.stopAnimating()
    }
}
