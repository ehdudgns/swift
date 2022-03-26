//
//  ViewController.swift
//  RPSGame
//
//  Created by 도영훈 on 2021/08/31.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultMessage: UILabel!
    @IBOutlet weak var computerImage: UIImageView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var computerSelect: UILabel!
    @IBOutlet weak var userSelect: UILabel!
    private var computer : String = "ready"
    private var user : String = "ready"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func setStyle(){
        computerSelect.text = "ready"
        userSelect.text = "ready"
        computerImage.image = UIImage(named: computer)
        userImage.image = UIImage(named: user)
    }
    
    @IBAction func selectScissor(_ sender: Any) {
        
    }
    
    @IBAction func selectRock(_ sender: Any) {
        
    }
    
    @IBAction func selectPaper(_ sender: Any) {
        
    }

    @IBAction func finalSelect(_ sender: Any) {
        
    }
    
    @IBAction func resetButton(_ sender: Any) {
        
    }
    
}

