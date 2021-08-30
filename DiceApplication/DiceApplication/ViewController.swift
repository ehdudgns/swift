//
//  ViewController.swift
//  DiceApplication
//
//  Created by 도영훈 on 2021/08/29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceImag1: UIImageView!
    @IBOutlet weak var diceImage2: UIImageView!
    @IBOutlet weak var rollBtn: UIButton!
    private var num1 : Int = 1
    private var num2 : Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    private func initView(){
        rollBtn.backgroundColor = .black
        makeView(num1,num2)
    }
    
    private func makeView(_ n1:Int, _ n2 : Int){
        let imageName1 = "black" + String(n1)
        let imageName2 = "black" + String(n2)
        diceImag1.image = UIImage(named:imageName1)
        diceImage2.image = UIImage(named: imageName2)
    }
    
    @IBAction func changeDice(_ sender: Any) {
        num1 = Int.random(in: 1...6)
        num2 = Int.random(in: 1...6)
        makeView(num1, num2)
    }
    

}

