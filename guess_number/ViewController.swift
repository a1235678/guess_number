//
//  ViewController.swift
//  guess_number
//
//  Created by zero plus on 2016/8/28.
//  Copyright © 2016年 zero plus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputNum: UITextField!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var textBoxLabel: UILabel!
    @IBOutlet weak var chanceLabel: UILabel!
    
    var finalNumber: Int = 0 //答案
    var chance = 6 //機會次數
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        finalNumber = Int(arc4random_uniform(98)) + 2 //隨機出現數字2~99
        minLabel.text = String(1)
        maxLabel.text = String(100)
        chance = 6
        inputNum.text = nil
        chanceLabel.text = "還剩\(chance)次機會"
        textBoxLabel.text = "請於以下範圍內，猜一個數字"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func running(){
        if let input = Int(inputNum.text!){
            if chance > 0{
                if input >= Int(minLabel.text!)! && input <= Int(maxLabel.text!)!{
                    chance -= 1
                    if input == finalNumber{
                        textBoxLabel.text = "完全正確！"
                    }else{
                        if chance == 0{
                            textBoxLabel.text = "機會都用完了！其實答案是\(finalNumber)😜"
                        }else{
                            if input > finalNumber{
                                maxLabel.text = "\(input)"
                                textBoxLabel.text = "\(input) 太大囉！"
                            }else if input < finalNumber{
                                minLabel.text = "\(input)"
                                textBoxLabel.text = "\(input) 太小了！"
                            }
                            inputNum.text = nil}
                    }
                }else{
                    textBoxLabel.text = "請輸入範圍內的數字！"
                }
            }else{
                textBoxLabel.text = "機會都用完了！其實答案是\(finalNumber)"
            }
            chanceLabel.text = "還剩\(chance)次機會"
        }
    }
    
    
    @IBAction func enterButton(_ sender: AnyObject) {
        running()
    }
    
    @IBAction func restartButton(_ sender: AnyObject) {
        viewDidLoad()
    }
    
    
    
}

