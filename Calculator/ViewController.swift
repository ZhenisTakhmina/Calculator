//
//  ViewController.swift
//  Calculator
//
//  Created by Tami on 07.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var firstNum : Double = 0.0
    var secondNum : Double = 0.0
    var performingMath : Bool = false
    var operation = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in ButtonCollection.indices{
            ButtonCollection[i].layer.cornerRadius = 40
        }
        
    }
    
    @IBOutlet var ButtonCollection: [UIButton]!
    
    @IBOutlet weak var resultView : UILabel!
    
    @IBAction func operatorsButton(_ sender: UIButton) {
        let tagButton = sender.tag
        
        if resultView.text != "" && tagButton != 18 && tagButton != 11 {            
            if let num = resultView.text {
                firstNum = Double(num) ?? 0.0
            } else {
                print("error nil")
            }
           
        }
        
        if tagButton == 18{
            resultView.text = ""
            operation = tagButton
            performingMath = true
        } else if tagButton == 12 {
            resultView.text = "+"
            operation = tagButton
            performingMath = true
        } else if tagButton == 13 {
            resultView.text = "-"
            operation = tagButton
            performingMath = true
        } else if tagButton == 14 {
            resultView.text = "x"
            operation = tagButton
            performingMath = true
        } else if tagButton == 15 {
            resultView.text = "/"
            operation = tagButton
            performingMath = true
        }else if tagButton == 16 {
            resultView.text = "%"
            operation = tagButton
            performingMath = true
        } else if tagButton == 17{
            resultView.text = String(-firstNum)
        } else if tagButton == 11 {
            if operation == 12{
                resultView.text = String(firstNum + secondNum)
            } else if operation == 13 {
                resultView.text = String(firstNum - secondNum)
            } else if operation == 14 {
                resultView.text = String(firstNum * secondNum)
            } else if operation == 15 {
                resultView.text = String(firstNum / secondNum)
            } else if operation == 16 {
                resultView.text = String(firstNum / 100)
            } else {
                resultView.text = "Error"
            }
        }
        else{
            print("error")
        }
        
    }
    
    @IBAction func digits(_ sender: UIButton) {
        
        let tagButton = sender.tag
       
        if performingMath == true {
            resultView.text = String(tagButton)
            performingMath = false
        }else{
            resultView.text = resultView.text! + String(tagButton)
        }
        
        if let num = resultView.text {
             secondNum = Double(num) ?? 0.0
        } else {
            print("error nil")
        }
        
    }
    
}

