//
//  ViewController.swift
//  whats the number
//
//  Created by bolin on 2019/6/17.
//  Copyright © 2019 bolin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //亂數
    var ans = Int.random(in: 1...100)
    var min = 1
    var max = 100
    var count = 0
    var isOver = false
    
    @IBOutlet var msgLable: UILabel!
    
    @IBOutlet var inputTextField: UITextField!
    
    @IBAction func makeAGuess(_ sender: UIButton) {
        
        if isOver == false{
            //game is on
            print(ans)
            let inputText = inputTextField.text!
            print( "input Text = \(inputText)")
            let inputNumber = Int(inputText)
            count += 1
            if inputNumber == nil {
                msgLable.text = "輸入有誤，請輸入:\(min)~\(max)之間的數字"
                
            }else if inputNumber! == ans{
                msgLable.text = "count: \(count)  answer= \(ans),Replay press guess"
                isOver = true
                
            }else{
                if inputNumber! == 0 || inputNumber! > max || inputNumber! < min {
                    msgLable.text = "輸入有誤，請輸入:\(min)~\(max)之間的數字"
                }else {
                    if inputNumber! > ans && inputNumber! < max {
                        max = inputNumber!-1
                        msgLable.text = "請輸入:\(min)~\(max)之間的數字"
                    }else if inputNumber! < ans && inputNumber! > min {
                        min = inputNumber!+1
                        msgLable.text = "請輸入:\(min)~\(max)之間的數字"
                    }
                }
                
            }
        }else{
            // game over replay
            ans = Int.random(in: 1...100)
            min = 1
            max = 100
            count = 0
            isOver = false
            msgLable.text = "請輸入:\(min)~\(max)之間的數字"

        }
    
        
        
   
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //push the keyboard up
        inputTextField.becomeFirstResponder()
        
    }


}

